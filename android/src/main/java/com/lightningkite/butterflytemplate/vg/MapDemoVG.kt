//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.location.GeoAddress
import com.lightningkite.butterfly.location.GeoCoordinate
import com.lightningkite.butterfly.location.geocode
import com.lightningkite.butterfly.maps.bindSelect
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.observables.observableNN
import com.lightningkite.butterfly.rx.removed
import com.lightningkite.butterfly.rx.until
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.onClick
import com.lightningkite.butterflytemplate.layouts.ComponentTextXml
import com.lightningkite.butterflytemplate.layouts.MapDemoXml
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.rxkotlin.subscribeBy
import java.util.concurrent.TimeUnit

class MapDemoVG() : ViewGenerator() {
    override val title: String get() = "Map Demo"

    val text: StandardObservableProperty<String> = StandardObservableProperty("")
    val position: StandardObservableProperty<GeoCoordinate?> = StandardObservableProperty(null)
    val options: StandardObservableProperty<List<GeoAddress>> = StandardObservableProperty(listOf())

    override fun generate(dependency: ActivityAccess): View {
        val xml = MapDemoXml()
        val view = xml.setup(dependency)

        xml.map.bindSelect(dependency, position)
        xml.select.bindString(text)
        xml.options.bind(options, GeoAddress()) { obs ->
            val xml = ComponentTextXml()
            val view = xml.setup(dependency)
            xml.label.bindString(obs.map { it -> it.oneLine() })
            xml.xmlRoot.onClick {
                this.position.value = obs.value.coordinate
            }
            return@bind view
        }

        text
            .observableNN
            .debounce(1000L, TimeUnit.MILLISECONDS)
            .distinctUntilChanged()
            .flatMap { dependency.geocode(it).observeOn(AndroidSchedulers.mainThread()).toObservable() }
            .subscribeBy {
                this.options.value = it
            }
            .until(view.removed)

        return view
    }
}
