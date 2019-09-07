//
// DateRangeDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class DateRangeDemoXml {

    lateinit var range: com.lightningkite.kwift.views.android.QuickMonthView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        range = view.findViewById<com.lightningkite.kwift.views.android.QuickMonthView>(R.id.range)
        return view
    }
}
