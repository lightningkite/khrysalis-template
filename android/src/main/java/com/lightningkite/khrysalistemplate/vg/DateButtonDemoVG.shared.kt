package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.time.*
import com.lightningkite.khrysalis.observables.binding.bind
import com.lightningkite.khrysalis.observables.binding.bindString
import com.lightningkite.khrysalis.observables.MutableObservableProperty
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.observables.map
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.DateButtonDemoXml
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
