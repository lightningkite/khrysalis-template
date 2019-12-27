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

    lateinit var range: com.lightningkite.kwift.views.android.SelectDateRangeView
    lateinit var month: com.lightningkite.kwift.views.actual.CustomView
    lateinit var monthDelegate: com.lightningkite.kwift.views.shared.MonthCVD
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        range = view.findViewById<com.lightningkite.kwift.views.android.SelectDateRangeView>(R.id.range)
        month = view.findViewById<com.lightningkite.kwift.views.actual.CustomView>(R.id.month)
        monthDelegate = view.findViewById<CustomView>(R.id.month).delegate as com.lightningkite.kwift.views.shared.MonthCVD
        
        return view
    }
}