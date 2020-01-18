package com.lightningkite.kwifttemplate.vg

import android.view.View
import com.lightningkite.kwift.time.*
import com.lightningkite.kwift.observables.binding.bind
import com.lightningkite.kwift.observables.binding.bindString
import com.lightningkite.kwift.observables.MutableObservableProperty
import com.lightningkite.kwift.observables.StandardObservableProperty
import com.lightningkite.kwift.observables.map
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.DateButtonDemoXml
import java.util.*

class DateButtonDemoVG() : ViewGenerator() {
    override val title: String get() = "Date Button Demo"

    val date: MutableObservableProperty<Date> = StandardObservableProperty(Date())

    override fun generate(dependency: ViewDependency): View {
        val xml = DateButtonDemoXml()
        val view = xml.setup(dependency)

        xml.text.bindString(date.map { it -> it.format(ClockPartSize.Medium, ClockPartSize.Medium) })
        xml.dateButton.bind(date)
        xml.timeButton.bind(date)

        return view
    }
}
