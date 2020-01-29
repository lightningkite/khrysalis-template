package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.location.requestLocation
import com.lightningkite.khrysalis.location.LocationResult
import com.lightningkite.khrysalis.observables.binding.bindString
import com.lightningkite.khrysalis.observables.MutableObservableProperty
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.observables.transformed
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.onClick
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.LocationDemoXml

class LocationDemoVG : ViewGenerator() {
    override val title: String get() = "Location Demo"

    val locationInfo: MutableObservableProperty<LocationResult?> = StandardObservableProperty<LocationResult?>(null)

    override fun generate(dependency: ViewDependency): View {
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
        xml.locationDisplay.bindString(locationInfo.transformed { it ->
            if(it != null){
                return@transformed "${it.coordinate}"
            } else {
                return@transformed "Nothing yet"
            }
        })
        return view
    }
}
