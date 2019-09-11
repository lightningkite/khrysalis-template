package com.lightningkite.kwift.observables.actual

import androidx.annotation.ColorRes
import com.alamkanak.weekview.WeekView
import com.alamkanak.weekview.WeekViewEvent
import com.lightningkite.kwift.observables.shared.ObservableProperty
import com.lightningkite.kwift.observables.shared.addAndRunWeak
import com.lightningkite.kwifttemplate.MyApplication
import java.util.*

fun WeekViewEvent(id: Long, title: String, start: Date, end: Date, @ColorRes colorRes: Int): WeekViewEvent {
    val event = WeekViewEvent(
        id,
        title,
        Calendar.getInstance().apply { time = start },
        Calendar.getInstance().apply { time = end })
    event.color = MyApplication.resources.getColor(colorRes)
    return event
}

fun WeekView.bind(
    data: ObservableProperty<(start: Date, end: Date) -> List<WeekViewEvent>>,
    onEventClick: (WeekViewEvent) -> Unit,
    onEmptyClick: (Date) -> Unit
) {
    data.addAndRunWeak(this) { self, load ->
        this.setMonthChangeListener { newYear, newMonth ->
            val calendar = Calendar.getInstance()
            calendar.set(newYear, newMonth - 1, 1, 0, 0, 0)
            val start = Date(calendar.timeInMillis)
            calendar.add(Calendar.MONTH, 1)
            val end = Date(calendar.timeInMillis)
            load(start, end)
        }
        this.notifyDatasetChanged()
    }
    this.setOnEventClickListener { event, eventRect -> onEventClick(event) }
    this.setEmptyViewClickListener { onEmptyClick(it.time) }
}
