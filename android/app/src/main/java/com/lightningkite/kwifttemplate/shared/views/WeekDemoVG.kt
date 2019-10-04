package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.actuals.hours
import com.lightningkite.kwift.actuals.plus
import com.lightningkite.kwift.observables.actual.WeekViewEvent
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.shared.ConstantObservableProperty
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwifttemplate.layouts.WeekDemoXml
import java.util.*

class WeekDemoVG() : ViewGenerator() {
    override val title: String get() = "Week Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = WeekDemoXml()
        val view = xml.setup(dependency)

        xml.week.bind(
            data = ConstantObservableProperty { start, end ->
                listOf(
                    WeekViewEvent(
                        id = 0,
                        title = "Event",
                        start = Date(),
                        end = Date() + 1.hours(),
                        colorRes = R.color.colorPrimary
                    )
                )
            },
            onEventClick = { it -> println(it) },
            onEmptyClick = { it -> println(it) }
        )

        return view
    }
}
