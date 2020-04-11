package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.DrawableDemoXml

class DrawableDemoVG() : ViewGenerator() {
    override val title: String get() = "Drawable Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = DrawableDemoXml()
        val view = xml.setup(dependency)

        return view
    }
}
