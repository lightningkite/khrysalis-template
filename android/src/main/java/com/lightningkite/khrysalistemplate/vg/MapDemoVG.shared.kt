package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.delay
import com.lightningkite.khrysalis.location.GeoAddress
import com.lightningkite.khrysalis.location.coordinate
import com.lightningkite.khrysalis.location.geocode
import com.lightningkite.khrysalis.location.oneLine
import com.lightningkite.khrysalis.location.GeoCoordinate
import com.lightningkite.khrysalis.maps.bindSelect
import com.lightningkite.khrysalis.observables.*
import com.lightningkite.khrysalis.observables.binding.bind
import com.lightningkite.khrysalis.observables.binding.bindString
import com.lightningkite.khrysalis.rx.removed
import com.lightningkite.khrysalis.rx.until
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.onClick
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.*
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.rxkotlin.subscribeBy
import java.util.concurrent.TimeUnit

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
