package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalis.views.asColor
import com.lightningkite.khrysalistemplate.layouts.DateRangeDemoXml
import java.util.*

class DateRangeDemoVG() : ViewGenerator() {
    override val title: String get() = "Date Range Demo"

    val start: StandardObservableProperty<Date?> = StandardObservableProperty(Date())
    val endInclusive: StandardObservableProperty<Date?> = StandardObservableProperty(Date())
    val dates: StandardObservableProperty<Set<Date>> = StandardObservableProperty(setOf())

    override fun generate(dependency: ViewDependency): View {
        val xml = DateRangeDemoXml()
        val view = xml.setup(dependency)


        xml.month2Delegate.dragEnabled = false
        xml.month2Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month2Delegate.selectedPaint.color = 0xFFFF0000.asColor()
        xml.month3Delegate.dragEnabled = false
        xml.month3Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month3Delegate.selectedPaint.color = 0xFFFF0000.asColor()
        xml.month4Delegate.dragEnabled = false
        xml.month4Delegate.selectedDayPaint.color = 0xFFFFFFFF.asColor()
        xml.month4Delegate.selectedPaint.color = 0xFFFF0000.asColor()

        return view
    }

}
