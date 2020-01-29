//
// BleClientDemoXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

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