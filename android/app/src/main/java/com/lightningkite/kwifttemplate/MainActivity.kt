package com.lightningkite.kwifttemplate

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.preference.PreferenceManager
import com.lightningkite.kwift.actuals.Preferences
import com.lightningkite.kwift.android.AccessibleActivity
import com.lightningkite.kwift.android.ViewDataView
import com.lightningkite.kwift.android.view
import com.lightningkite.kwift.shared.ViewDataStack
import com.lightningkite.kwifttemplate.shared.views.MainViewData


class MainActivity : AccessibleActivity() {

    companion object {
        val viewData: MainViewData by lazy { MainViewData() }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(viewData.view(this))
    }

    override fun onBackPressed() {
        if (!ViewDataView.onBackPressed()) super.onBackPressed()
    }
}
