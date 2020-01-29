//
// PongDemoXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class PongDemoXml {

    lateinit var customView: com.lightningkite.khrysalis.views.CustomView
    lateinit var customViewDelegate: com.lightningkite.khrysalistemplate.vg.PongDelegate
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.pong_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        customView = view.findViewById<com.lightningkite.khrysalis.views.CustomView>(R.id.customView)
        customViewDelegate = view.findViewById<CustomView>(R.id.customView).delegate as com.lightningkite.khrysalistemplate.vg.PongDelegate
        
        return view
    }
}