//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.ObservableStack
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.ComponentTestXml
import com.lightningkite.butterflytemplate.layouts.ViewPagerDemoXml

class ViewPagerDemoVG(val stack: ObservableStack<ViewGenerator>) : ViewGenerator() {
    override val title: String get() = "View Pager Demo"

    val items: List<String> = listOf(
        "First",
        "Second",
        "Third"
    )
    val selectedIndex: StandardObservableProperty<Int> = StandardObservableProperty(0)

    override fun generate(dependency: ActivityAccess): View {
        val xml = ViewPagerDemoXml()
        val view = xml.setup(dependency)

        xml.viewPager.bind(items, selectedIndex) { it ->
            val xml = ComponentTestXml()
            val view = xml.setup(dependency)
            xml.label.text = it
            return@bind view
        }
        xml.viewPagerIndicator.bind(items.size, selectedIndex)

        return view
    }
}
