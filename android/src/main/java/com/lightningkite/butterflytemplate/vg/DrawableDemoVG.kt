//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.rx.viewgenerators.ActivityAccess
import com.lightningkite.rx.viewgenerators.*
import com.lightningkite.rx.android.resources.*
import com.lightningkite.butterflytemplate.databinding.DrawableDemoBinding

class DrawableDemoVG() : ViewGenerator {
    override val titleString: ViewString get() = ViewStringRaw("Drawable Demo")

    override fun generate(dependency: ActivityAccess): View {
        val xml = DrawableDemoBinding.inflate(dependency.layoutInflater)
        val view = xml.root

        return view
    }
}
