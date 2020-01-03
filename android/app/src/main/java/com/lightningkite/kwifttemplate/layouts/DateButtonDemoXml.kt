//
// DateButtonDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class DateButtonDemoXml {

    lateinit var text: TextView
    lateinit var dateButton: com.lightningkite.kwift.views.android.DateButton
    lateinit var timeButton: com.lightningkite.kwift.views.android.TimeButton
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_button_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        text = view.findViewById<TextView>(R.id.text)
        dateButton = view.findViewById<com.lightningkite.kwift.views.android.DateButton>(R.id.dateButton)
        timeButton = view.findViewById<com.lightningkite.kwift.views.android.TimeButton>(R.id.timeButton)
        
        
        return view
    }
}