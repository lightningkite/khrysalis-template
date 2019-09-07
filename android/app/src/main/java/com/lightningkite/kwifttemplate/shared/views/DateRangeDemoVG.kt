package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.DateRangeDemoXml

class DateRangeDemoVG() : ViewGenerator() {
    override val title: String get() = "Date Range Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = DateRangeDemoXml()
        val view = xml.setup(dependency)

        return view
    }
}
