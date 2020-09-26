//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.location.LocationResult
import com.lightningkite.butterfly.location.requestLocation
import com.lightningkite.butterfly.observables.MutableObservableProperty
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.observables.transformed
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.onClick
import com.lightningkite.butterflytemplate.layouts.LocationDemoXml

class LocationDemoVG : ViewGenerator() {
    override val title: String get() = "Location Demo"

    val locationInfo: MutableObservableProperty<LocationResult?> = StandardObservableProperty<LocationResult?>(null)

    override fun generate(dependency: ActivityAccess): View {
        val xml = LocationDemoXml()
        val view = xml.setup(dependency)
        xml.getLocation.onClick {
            dependency.requestLocation(
                accuracyBetterThanMeters = 100.0,
                timeoutInSeconds = 5.0
            ) { location, message ->
                println(message)
                this.locationInfo.value = location
            }
        }
        xml.locationDisplay.bindString(locationInfo.map { it ->
            if(it != null){
                return@map "${it.coordinate}"
            } else {
                return@map "Nothing yet"
            }
        })
        return view
    }
}
