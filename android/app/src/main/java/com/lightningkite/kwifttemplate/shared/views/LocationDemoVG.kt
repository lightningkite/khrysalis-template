package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.location.actual.requestLocation
import com.lightningkite.kwift.location.shared.LocationResult
import com.lightningkite.kwift.observables.actual.bindString
import com.lightningkite.kwift.observables.shared.MutableObservableProperty
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.observables.shared.transformed
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.ViewGenerator
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
