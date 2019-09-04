package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.RowTestXml
import com.lightningkite.kwifttemplate.xml.ViewPagerDemoXml

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
