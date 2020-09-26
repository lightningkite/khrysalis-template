//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.onClick
import com.lightningkite.butterflytemplate.layouts.MarginTestXml

class MarginTestsVG : ViewGenerator() {
    override val title: String get() = "Margin Tests"

    override fun generate(dependency: ActivityAccess): View {
        val xml = MarginTestXml()
        val view = xml.setup(dependency)
        xml.scrollToTop.onClick {
            xml.scrollView.smoothScrollTo(0,0)
        }
        return view
    }
}
