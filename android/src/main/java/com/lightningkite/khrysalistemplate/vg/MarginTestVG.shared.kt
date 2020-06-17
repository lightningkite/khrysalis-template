package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.captureWeak
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalis.views.onClick
import com.lightningkite.khrysalistemplate.layouts.MarginTestXml

class MarginTestsVG : ViewGenerator() {
    override val title: String get() = "Margin Tests"

    override fun generate(dependency: ViewDependency): View {
        val xml = MarginTestXml()
        val view = xml.setup(dependency)
        xml.scrollToTop.onClick {
            xml.scrollView.smoothScrollTo(0,0)
        }
        return view
    }
}
