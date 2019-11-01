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
    lateinit var multi: com.lightningkite.kwift.views.android.SelectMultipleDatesView
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        range = view.findViewById<com.lightningkite.kwift.views.android.SelectDateRangeView>(R.id.range)
        multi = view.findViewById<com.lightningkite.kwift.views.android.SelectMultipleDatesView>(R.id.multi)
        
        return view
    }
}