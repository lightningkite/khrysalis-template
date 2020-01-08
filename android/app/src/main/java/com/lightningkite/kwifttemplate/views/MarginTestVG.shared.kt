package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.observables.binding.*
import com.lightningkite.kwift.observables.*
import com.lightningkite.kwift.captureWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.onClick
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwift.views.ViewStringRaw
import com.lightningkite.kwift.views.showDialog
import com.lightningkite.kwifttemplate.layouts.MarginTestsXml

class MarginTestsVG : ViewGenerator() {
    override val title: String get() = "Margin Tests"

    override fun generate(dependency: ViewDependency): View {
        val xml = MarginTestsXml()
        val view = xml.setup(dependency)
        return view
    }
}
