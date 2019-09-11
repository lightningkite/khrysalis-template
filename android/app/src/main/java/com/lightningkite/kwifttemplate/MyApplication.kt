package com.lightningkite.kwifttemplate

import android.app.Application
import android.content.res.Resources
import android.preference.PreferenceManager
import com.lightningkite.kwift.actuals.Preferences

class MyApplication: Application() {
    companion object {
        lateinit var resources: Resources
    }
    override fun onCreate() {
        super.onCreate()
        Companion.resources = this.resources

        Preferences.sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this)
    }
}
