//
// DateRangeDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R
import java.util.*

class DateRangeDemoXml {

    lateinit var select: com.lightningkite.kwift.views.android.SelectDayView
    lateinit var range: com.lightningkite.kwift.views.android.SelectDateRangeView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        select = view.findViewById<com.lightningkite.kwift.views.android.SelectDayView>(R.id.select)
        range = view.findViewById<com.lightningkite.kwift.views.android.SelectDateRangeView>(R.id.range)
        select.selected.value = Calendar.getInstance()
        range.start.value = Calendar.getInstance().apply { set(2019, 7, 1) }
        range.endInclusive.value = Calendar.getInstance().apply { set(2019, 10, 1) }

        select.selected.onChange.add { it ->
            println("select.selected changed to ${it}")
            return@add false
        }
        range.start.onChange.add { it ->
            println("range.start changed to ${it}")
            return@add false
        }
        range.endInclusive.onChange.add { it ->
            println("range.endInclusive changed to ${it}")
            return@add false
        }
        return view
    }
}
