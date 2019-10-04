//
// DateRangeDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class DateRangeDemoXml {

    lateinit var select: com.lightningkite.kwift.views.android.SelectDayView
    lateinit var range: com.lightningkite.kwift.views.android.SelectDateRangeView


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        select = view.findViewById<com.lightningkite.kwift.views.android.SelectDayView>(R.id.select)
        range = view.findViewById<com.lightningkite.kwift.views.android.SelectDateRangeView>(R.id.range)

        return view
    }
}
