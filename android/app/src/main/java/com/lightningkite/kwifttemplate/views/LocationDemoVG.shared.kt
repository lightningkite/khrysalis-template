package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.location.requestLocation
import com.lightningkite.kwift.location.LocationResult
import com.lightningkite.kwift.observables.binding.bindString
import com.lightningkite.kwift.observables.MutableObservableProperty
import com.lightningkite.kwift.observables.StandardObservableProperty
import com.lightningkite.kwift.observables.transformed
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.onClick
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.LocationDemoXml

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
