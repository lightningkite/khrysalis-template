//
// DateRangeDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.*
import com.lightningkite.kwifttemplate.R

class DateRangeDemoXml {

    lateinit var month: com.lightningkite.kwift.views.CustomView
    lateinit var month2: com.lightningkite.kwift.views.CustomView
    lateinit var month3: com.lightningkite.kwift.views.CustomView
    lateinit var month4: com.lightningkite.kwift.views.CustomView
    lateinit var monthDelegate: com.lightningkite.kwift.views.MonthCVD
    lateinit var month2Delegate: com.lightningkite.kwift.views.SelectDateMonthCVD
    lateinit var month3Delegate: com.lightningkite.kwift.views.SelectDateRangeMonthCVD
    lateinit var month4Delegate: com.lightningkite.kwift.views.SelectMultipleDatesMonthCVD
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        month = view.findViewById<com.lightningkite.kwift.views.CustomView>(R.id.month)
        month2 = view.findViewById<com.lightningkite.kwift.views.CustomView>(R.id.month2)
        month3 = view.findViewById<com.lightningkite.kwift.views.CustomView>(R.id.month3)
        month4 = view.findViewById<com.lightningkite.kwift.views.CustomView>(R.id.month4)
        monthDelegate = view.findViewById<CustomView>(R.id.month).delegate as com.lightningkite.kwift.views.MonthCVD
        month2Delegate = view.findViewById<CustomView>(R.id.month2).delegate as com.lightningkite.kwift.views.SelectDateMonthCVD
        month3Delegate = view.findViewById<CustomView>(R.id.month3).delegate as com.lightningkite.kwift.views.SelectDateRangeMonthCVD
        month4Delegate = view.findViewById<CustomView>(R.id.month4).delegate as com.lightningkite.kwift.views.SelectMultipleDatesMonthCVD
        
        return view
    }
}