package com.lightningkite.kwifttemplate.vg

import android.view.View
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.MarginTestXml

class MarginTestsVG : ViewGenerator() {
    override val title: String get() = "Margin Tests"

    override fun generate(dependency: ViewDependency): View {
        val xml = MarginTestXml()
        val view = xml.setup(dependency)
        return view
    }
}
