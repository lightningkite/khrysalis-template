package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.alamkanak.weekview.WeekViewEvent
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.WeekDemoXml

class WeekDemoVG() : ViewGenerator() {
    override val title: String get() = "Week Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = WeekDemoXml()
        val view = xml.setup(dependency)

        xml.week.setMonthChangeListener { newYear, newMonth ->
            listOf(
                WeekViewEvent(
                    newYear * 120L + newMonth * 10 + 0,
                    "Test (5th)",
                    newYear,
                    newMonth,
                    5,
                    10,
                    0,
                    newYear,
                    newMonth,
                    5,
                    18,
                    0
                ),
                WeekViewEvent(
                    newYear * 120L + newMonth * 10 + 0,
                    "Test (10th)",
                    newYear,
                    newMonth,
                    10,
                    10,
                    0,
                    newYear,
                    newMonth,
                    10,
                    18,
                    0
                ),
                WeekViewEvent(
                    newYear * 120L + newMonth * 10 + 0,
                    "Test (15th)",
                    newYear,
                    newMonth,
                    15,
                    10,
                    0,
                    newYear,
                    newMonth,
                    15,
                    18,
                    0
                )
            )
        }

        return view
    }
}
