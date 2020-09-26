//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.DrawableDemoXml

class DrawableDemoVG() : ViewGenerator() {
    override val title: String get() = "Drawable Demo"

    override fun generate(dependency: ActivityAccess): View {
        val xml = DrawableDemoXml()
        val view = xml.setup(dependency)

        return view
    }
}
