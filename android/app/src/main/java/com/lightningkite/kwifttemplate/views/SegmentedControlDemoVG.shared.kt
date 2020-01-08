package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.observables.binding.bind
import com.lightningkite.kwift.observables.StandardObservableProperty
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.SegmentedControlDemoXml

class SegmentedControlDemoVG() : ViewGenerator() {
    override val title: String get() = "Segmented Control Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = SegmentedControlDemoXml()
        val view = xml.setup(dependency)

        xml.tabs.bind(listOf("A", "B", "C"), StandardObservableProperty(0))
        xml.tabs2.bind(listOf("A", "B", "C", "D", "E", "F", "G"), StandardObservableProperty(0))

        return view
    }
}
