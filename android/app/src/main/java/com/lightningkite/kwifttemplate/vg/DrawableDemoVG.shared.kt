package com.lightningkite.kwifttemplate.vg

import android.view.View
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.DrawableDemoXml

class DrawableDemoVG() : ViewGenerator() {
    override val title: String get() = "Drawable Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = DrawableDemoXml()
        val view = xml.setup(dependency)

        return view
    }
}
