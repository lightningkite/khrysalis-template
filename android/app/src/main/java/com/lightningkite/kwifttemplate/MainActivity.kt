package com.lightningkite.kwifttemplate

import android.os.Bundle
import com.lightningkite.kwift.android.AccessibleActivity
import com.lightningkite.kwifttemplate.shared.views.MainVG


class MainActivity : AccessibleActivity() {

    companion object {
        val viewData: MainVG by lazy { MainVG() }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(viewData.generate(this))
    }

    override fun onBackPressed() {
        if (!viewData.stack.pop()) super.onBackPressed()
    }
}
