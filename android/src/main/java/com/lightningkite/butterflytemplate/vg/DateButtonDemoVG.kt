//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.MutableObservableProperty
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.time.ClockPartSize
import com.lightningkite.butterfly.time.format
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.DateButtonDemoXml
import java.util.*

class DateButtonDemoVG() : ViewGenerator() {
    override val title: String get() = "Date Button Demo"

    val date: MutableObservableProperty<Date> = StandardObservableProperty(Date())

    override fun generate(dependency: ActivityAccess): View {
        val xml = DateButtonDemoXml()
        val view = xml.setup(dependency)

        xml.text.bindString(date.map { it -> it.format(ClockPartSize.Medium, ClockPartSize.Medium) })
        xml.dateButton.bind(date)
        xml.timeButton.bind(date)

        return view
    }
}
