//
// DateButtonDemoXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class DateButtonDemoXml {

    lateinit var text: TextView
    lateinit var dateButton: com.lightningkite.khrysalis.views.android.DateButton
    lateinit var timeButton: com.lightningkite.khrysalis.views.android.TimeButton
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_button_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        text = view.findViewById<TextView>(R.id.text)
        dateButton = view.findViewById<com.lightningkite.khrysalis.views.android.DateButton>(R.id.dateButton)
        timeButton = view.findViewById<com.lightningkite.khrysalis.views.android.TimeButton>(R.id.timeButton)
        
        
        return view
    }
}