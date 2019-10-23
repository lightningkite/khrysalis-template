//
// LocationDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class LocationDemoXml {

    lateinit var getLocation: Button
    lateinit var locationDisplay: TextView
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.location_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        getLocation = view.findViewById<Button>(R.id.get_location)
        locationDisplay = view.findViewById<TextView>(R.id.location_display)
        
        return view
    }
}