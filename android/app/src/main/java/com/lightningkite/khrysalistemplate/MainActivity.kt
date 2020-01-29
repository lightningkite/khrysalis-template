package com.lightningkite.khrysalistemplate

import com.lightningkite.khrysalis.android.KhrysalisActivity
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.vg.MainVG


class MainActivity : KhrysalisActivity() {
    companion object {
        val viewData: ViewGenerator by lazy { MainVG() }
    }

    override val main: ViewGenerator
        get() = viewData


}
