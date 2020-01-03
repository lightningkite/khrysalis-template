package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.WeekDemoXml

class WeekDemoVG() : ViewGenerator() {
    override val title: String get() = "Week Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = WeekDemoXml()
        val view = xml.setup(dependency)

        return view
    }
}
