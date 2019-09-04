package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.SliderDemoXml

class SliderDemoVG() : ViewGenerator() {
    override val title: String get() = "Slider Demo"

    val obs: StandardObservableProperty<Int> = StandardObservableProperty(0)

    override fun generate(dependency: ViewDependency): View {
        val xml = SliderDemoXml()
        val view = xml.setup(dependency)

        xml.slider.bind(0, 20, obs)
        xml.valueDisplay.bindText(obs) { it -> it.toString() }

        return view
    }
}
