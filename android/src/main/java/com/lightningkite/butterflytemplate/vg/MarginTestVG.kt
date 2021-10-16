//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.rx.viewgenerators.ActivityAccess
import com.lightningkite.rx.viewgenerators.*
import com.lightningkite.rx.android.resources.*
import com.lightningkite.rx.android.onClick
import com.lightningkite.butterflytemplate.databinding.MarginTestBinding

class MarginTestsVG : ViewGenerator {
    override val titleString: ViewString get() = ViewStringRaw("Margin Tests")

    override fun generate(dependency: ActivityAccess): View {
        val xml = MarginTestBinding.inflate(dependency.layoutInflater)
        val view = xml.root
        xml.scrollToTop.onClick {
            xml.scrollView.smoothScrollTo(0,0)
        }
        return view
    }
}
