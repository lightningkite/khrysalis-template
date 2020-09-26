package com.lightningkite.butterflytemplate

import android.os.Bundle
import com.lightningkite.butterfly.android.ButterflyActivity
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.vg.MainVG


class MainActivity : ButterflyActivity() {
    companion object {
        val viewData: ViewGenerator by lazy { MainVG() }
    }

    override val main: ViewGenerator
        get() = viewData

    override fun onCreate(savedInstanceState: Bundle?) {
//        window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
        super.onCreate(savedInstanceState)
    }
}
