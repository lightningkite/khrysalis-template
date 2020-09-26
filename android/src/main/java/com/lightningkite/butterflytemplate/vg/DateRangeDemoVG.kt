//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.asColor
import com.lightningkite.butterflytemplate.layouts.DateRangeDemoXml
import java.util.*

class DateRangeDemoVG() : ViewGenerator() {
    override val title: String get() = "Date Range Demo"

    val start: StandardObservableProperty<Date?> = StandardObservableProperty(Date())
    val endInclusive: StandardObservableProperty<Date?> = StandardObservableProperty(Date())
    val dates: StandardObservableProperty<Set<Date>> = StandardObservableProperty(setOf())

    override fun generate(dependency: ActivityAccess): View {
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
