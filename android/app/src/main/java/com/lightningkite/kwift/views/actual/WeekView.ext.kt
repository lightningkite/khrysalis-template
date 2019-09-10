package com.lightningkite.kwift.views.actual

import com.alamkanak.weekview.WeekView
import com.alamkanak.weekview.WeekViewEvent
import java.util.*

fun WeekView.bind(data: (year: Int, month: Int) -> List<WeekViewEvent>) {
    this.setMonthChangeListener { newYear, newMonth ->
        data(newYear, newMonth)
    }
}

fun WeekView.onEventClick(action: (WeekViewEvent) -> Unit) {
    this.setOnEventClickListener { event, eventRect -> action(event) }
}

fun WeekView.onEmptyClick(action: (Date) -> Unit) {
    this.setEmptyViewClickListener { action(it.time) }
}
