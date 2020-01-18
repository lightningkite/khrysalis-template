//
// BleScanDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.*
import com.lightningkite.kwifttemplate.R

class BleScanDemoXml {

    lateinit var button: Button
    lateinit var host: Button
    lateinit var status: TextView
    lateinit var items: com.lightningkite.kwift.views.android.VerticalRecyclerView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.ble_scan_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        button = view.findViewById<Button>(R.id.button)
        host = view.findViewById<Button>(R.id.host)
        status = view.findViewById<TextView>(R.id.status)
        items = view.findViewById<com.lightningkite.kwift.views.android.VerticalRecyclerView>(R.id.items)
        
        
        return view
    }
}