//
// MapDemoXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class MapDemoXml {

    lateinit var map: com.google.android.gms.maps.MapView
    lateinit var select: EditText
    lateinit var options: androidx.recyclerview.widget.RecyclerView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.map_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        map = view.findViewById<com.google.android.gms.maps.MapView>(R.id.map)
        select = view.findViewById<EditText>(R.id.select)
        options = view.findViewById<androidx.recyclerview.widget.RecyclerView>(R.id.options)
        
        
        
        return view
    }
}