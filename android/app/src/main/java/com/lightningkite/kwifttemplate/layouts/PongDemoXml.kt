//
// PongDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.*
import com.lightningkite.kwifttemplate.R

class PongDemoXml {

    lateinit var customView: com.lightningkite.kwift.views.CustomView
    lateinit var customViewDelegate: com.lightningkite.kwifttemplate.views.PongDelegate
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.pong_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        customView = view.findViewById<com.lightningkite.kwift.views.CustomView>(R.id.customView)
        customViewDelegate = view.findViewById<CustomView>(R.id.customView).delegate as com.lightningkite.kwifttemplate.views.PongDelegate
        
        return view
    }
}