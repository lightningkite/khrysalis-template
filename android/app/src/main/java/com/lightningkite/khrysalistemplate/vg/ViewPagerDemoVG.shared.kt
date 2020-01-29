package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.observables.binding.bind
import com.lightningkite.khrysalis.observables.ObservableStack
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.ComponentTestXml
import com.lightningkite.khrysalistemplate.layouts.ViewPagerDemoXml

class ViewPagerDemoVG(val stack: ObservableStack<ViewGenerator>) : ViewGenerator() {
    override val title: String get() = "View Pager Demo"

    val items: List<String> = listOf(
        "First",
        "Second",
        "Third"
    )
    val selectedIndex: StandardObservableProperty<Int> = StandardObservableProperty(0)

    override fun generate(dependency: ViewDependency): View {
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
