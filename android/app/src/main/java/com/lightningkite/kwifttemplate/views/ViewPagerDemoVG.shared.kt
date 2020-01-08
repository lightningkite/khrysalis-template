package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.observables.binding.bind
import com.lightningkite.kwift.observables.ObservableStack
import com.lightningkite.kwift.observables.StandardObservableProperty
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.RowTestXml
import com.lightningkite.kwifttemplate.layouts.ViewPagerDemoXml

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
            val xml = RowTestXml()
            val view = xml.setup(dependency)
            xml.label.text = it
            return@bind view
        }
        xml.viewPagerIndicator.bind(items.size, selectedIndex)

        return view
    }
}
