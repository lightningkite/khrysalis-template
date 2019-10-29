package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.actual.delay
import com.lightningkite.kwift.location.actual.GeoAddress
import com.lightningkite.kwift.location.actual.coordinate
import com.lightningkite.kwift.location.actual.geocode
import com.lightningkite.kwift.location.actual.oneLine
import com.lightningkite.kwift.location.shared.GeoCoordinate
import com.lightningkite.kwift.maps.actual.PlacesAutocomplete
import com.lightningkite.kwift.maps.actual.bindSelect
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindString
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.observables.shared.addAndRunWeak
import com.lightningkite.kwift.observables.shared.transformed
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.ControlsDemoXml
import com.lightningkite.kwifttemplate.layouts.MapDemoXml
import com.lightningkite.kwifttemplate.layouts.RowTextXml

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
            val xml = RowTextXml()
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
