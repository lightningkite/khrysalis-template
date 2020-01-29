//
// SelectDemoXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class SelectDemoXml {

    lateinit var list: androidx.recyclerview.widget.RecyclerView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.select_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        list = view.findViewById<androidx.recyclerview.widget.RecyclerView>(R.id.list)
        
        
        return view
    }
}