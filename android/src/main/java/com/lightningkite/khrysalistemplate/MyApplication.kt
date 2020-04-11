package com.lightningkite.khrysalistemplate

import android.app.Application
import android.content.pm.PackageManager
import android.content.res.Resources
import android.preference.PreferenceManager
import com.google.android.libraries.places.api.Places
import com.lightningkite.khrysalis.Preferences
import com.lightningkite.khrysalis.net.HttpClient

class MyApplication: Application() {
    companion object {
        lateinit var resources: Resources
    }
    override fun onCreate() {
        super.onCreate()
        HttpClient.appContext = this
        Companion.resources = this.resources
        Places.initialize(
            this,
            packageManager
                .getApplicationInfo(packageName, PackageManager.GET_META_DATA)
                .metaData
                .getString("com.google.android.geo.API_KEY", "")
        )
        Preferences.sharedPreferences = PreferenceManager.getDefaultSharedPreferences(this)
    }
}
