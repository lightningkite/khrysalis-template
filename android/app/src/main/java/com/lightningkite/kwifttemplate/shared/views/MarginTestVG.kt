package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.*
import com.lightningkite.kwift.observables.shared.*
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwift.views.shared.ViewStringRaw
import com.lightningkite.kwift.views.shared.showDialog
import com.lightningkite.kwifttemplate.layouts.MarginTestsXml

class MarginTestsVG : ViewGenerator() {
    override val title: String get() = "Margin Tests"

    override fun generate(dependency: ViewDependency): View {
        val xml = MarginTestsXml()
        val view = xml.setup(dependency)
        xml.one.onClick {
            showDialog(ViewStringRaw("one"))
        }
        xml.two.onClick {
            showDialog(ViewStringRaw("two"))
        }
        xml.three.onClick {
            showDialog(ViewStringRaw("three"))
        }
        xml.four.onClick {
            showDialog(ViewStringRaw("four"))
        }
        xml.five.onClick {
            showDialog(ViewStringRaw("five"))
        }
        return view
    }
}
