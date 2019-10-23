package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bindString
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.actual.loadUrl
import com.lightningkite.kwift.observables.shared.MutableObservableProperty
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.observables.shared.transformed
import com.lightningkite.kwift.shared.LocationResult
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.LocationDemoXml

class LocationDemoVG : ViewGenerator() {
    override val title: String get() = "Location Demo"

    val locationInfo: MutableObservableProperty<LocationResult?> = StandardObservableProperty<LocationResult?>(null)

    override fun generate(dependency: ViewDependency): View {
        val xml = LocationDemoXml()
        val view = xml.setup(dependency)
        xml.getLocation.onClick {
            dependency.requestLocation(100.0) { it ->
                this.locationInfo.value = it
            }
        }
        xml.locationDisplay.bindString(locationInfo.transformed { it ->
            if(it != null){
                return@transformed "${it.latitude}, ${it.longitude}"
            } else {
                return@transformed "Nothing yet"
            }
        })
        return view
    }
}
