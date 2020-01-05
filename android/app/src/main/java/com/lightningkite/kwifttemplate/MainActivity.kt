package com.lightningkite.kwifttemplate

import com.lightningkite.kwift.android.AccessibleActivity
import com.lightningkite.kwift.android.KwiftActivity
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.views.MainVG


class MainActivity : KwiftActivity() {
    companion object {
        val viewData: ViewGenerator by lazy { MainVG() }
    }

    override val main: ViewGenerator
        get() = viewData


}
