package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.delay
import com.lightningkite.khrysalis.location.GeoAddress
import com.lightningkite.khrysalis.location.coordinate
import com.lightningkite.khrysalis.location.geocode
import com.lightningkite.khrysalis.location.oneLine
import com.lightningkite.khrysalis.location.GeoCoordinate
import com.lightningkite.khrysalis.maps.bindSelect
import com.lightningkite.khrysalis.observables.binding.bind
import com.lightningkite.khrysalis.observables.binding.bindString
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.observables.addAndRunWeak
import com.lightningkite.khrysalis.observables.transformed
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.onClick
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.*

class MapDemoVG() : ViewGenerator() {
    override val title: String get() = "Map Demo"

    val text: StandardObservableProperty<String> = StandardObservableProperty("")
    val position: StandardObservableProperty<GeoCoordinate?> = StandardObservableProperty(null)
    val options: StandardObservableProperty<List<GeoAddress>> = StandardObservableProperty(listOf())

    override fun generate(dependency: ViewDependency): View {
        val xml = MapDemoXml()
        val view = xml.setup(dependency)

        xml.map.bindSelect(dependency, position)
        xml.select.bindString(text)
        xml.options.bind(options, GeoAddress()) { obs ->
            val xml = ComponentTextXml()
            val view = xml.setup(dependency)
            xml.label.bindString(obs.transformed { it -> it.oneLine() })
            xml.xmlRoot.onClick {
                this.position.value = obs.value.coordinate
            }
            return@bind view
        }

        text.addAndRunWeak(this){ self, value ->
            delay(1000){
                if(self.text.value == value && value.isNotBlank()){
                    dependency.geocode(value) { addresses ->
                        self.options.value = addresses
                    }
                }
            }
        }

        return view
    }
}
