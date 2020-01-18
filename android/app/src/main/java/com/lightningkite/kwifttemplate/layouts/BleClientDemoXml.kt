//
// BleClientDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.*
import com.lightningkite.kwifttemplate.R

class BleClientDemoXml {

    lateinit var status: TextView
    lateinit var charValue: EditText
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.ble_client_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        status = view.findViewById<TextView>(R.id.status)
        charValue = view.findViewById<EditText>(R.id.charValue)
        
        
        return view
    }
}