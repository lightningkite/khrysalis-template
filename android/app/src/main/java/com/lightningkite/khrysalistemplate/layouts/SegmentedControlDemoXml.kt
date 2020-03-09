//
// SegmentedControlDemoXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class SegmentedControlDemoXml {

    lateinit var tabs: com.google.android.material.tabs.TabLayout
    lateinit var tabs2: com.google.android.material.tabs.TabLayout
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.segmented_control_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        tabs = view.findViewById<com.google.android.material.tabs.TabLayout>(R.id.tabs)
        tabs2 = view.findViewById<com.google.android.material.tabs.TabLayout>(R.id.tabs2)
        
        
        
        return view
    }
}