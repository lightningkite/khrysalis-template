//
// ComponentBleDeviceXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.*
import com.lightningkite.kwifttemplate.R

class ComponentBleDeviceXml {

    lateinit var deviceName: TextView
    lateinit var deviceId: TextView
    lateinit var rssi: TextView
    lateinit var connect: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.component_ble_device, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        deviceName = view.findViewById<TextView>(R.id.deviceName)
        deviceId = view.findViewById<TextView>(R.id.deviceId)
        rssi = view.findViewById<TextView>(R.id.rssi)
        connect = view.findViewById<Button>(R.id.connect)
        
        
        return view
    }
}