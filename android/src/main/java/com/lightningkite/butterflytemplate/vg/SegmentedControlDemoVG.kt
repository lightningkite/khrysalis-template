//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.SegmentedControlDemoXml

class SegmentedControlDemoVG() : ViewGenerator() {
    override val title: String get() = "Segmented Control Demo"

    override fun generate(dependency: ActivityAccess): View {
        val xml = SegmentedControlDemoXml()
        val view = xml.setup(dependency)

        xml.tabs.bind(listOf("A", "B", "C"), StandardObservableProperty(0))
        xml.tabs2.bind(listOf("A", "B", "C", "D", "E", "F", "G"), StandardObservableProperty(0))

        return view
    }
}
