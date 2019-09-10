package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.alamkanak.weekview.WeekViewEvent
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.bind
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.WeekDemoXml

class WeekDemoVG() : ViewGenerator() {
    override val title: String get() = "Week Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = WeekDemoXml()
        val view = xml.setup(dependency)

        xml.week.bind { year, month ->
            listOf(
                WeekViewEvent(
                    year * 120L + month * 10 + 0,
                    "Test (5th)",
                    year,
                    month,
                    5,
                    10,
                    0,
                    year,
                    month,
                    5,
                    18,
                    0
                ),
                WeekViewEvent(
                    year * 120L + month * 10 + 0,
                    "Test (10th)",
                    year,
                    month,
                    10,
                    10,
                    0,
                    year,
                    month,
                    10,
                    18,
                    0
                ),
                WeekViewEvent(
                    year * 120L + month * 10 + 0,
                    "Test (15th)",
                    year,
                    month,
                    15,
                    10,
                    0,
                    year,
                    month,
                    15,
                    18,
                    0
                )
            )
        }

        return view
    }
}
