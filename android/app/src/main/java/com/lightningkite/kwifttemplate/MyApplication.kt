package com.lightningkite.kwifttemplate

import android.app.Application
import android.preference.PreferenceManager
import com.lightningkite.kwift.actuals.Preferences

class MyApplication: Application() {
    override fun onCreate() {
        super.onCreate()

        Preferences.sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this)
    }
}
