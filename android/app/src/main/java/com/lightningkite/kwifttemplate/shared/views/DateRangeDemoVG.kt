package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.DateRangeDemoXml
import java.util.*

class DateRangeDemoVG() : ViewGenerator() {
    override val title: String get() = "Date Range Demo"

    val start: StandardObservableProperty<Date?> = StandardObservableProperty(Date())
    val endInclusive: StandardObservableProperty<Date?> = StandardObservableProperty(Date())

    override fun generate(dependency: ViewDependency): View {
        val xml = DateRangeDemoXml()
        val view = xml.setup(dependency)

        xml.range.bind(start, endInclusive)
        xml.select.bind(start)

        return view
    }
}
