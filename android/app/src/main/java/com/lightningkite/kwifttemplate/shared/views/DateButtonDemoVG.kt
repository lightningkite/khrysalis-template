package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.actual.*
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindString
import com.lightningkite.kwift.observables.shared.MutableObservableProperty
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.observables.shared.combine
import com.lightningkite.kwift.observables.shared.map
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.ControlsDemoXml
import com.lightningkite.kwifttemplate.layouts.DateButtonDemoXml
import com.lightningkite.kwifttemplate.layouts.RowTextXml
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
