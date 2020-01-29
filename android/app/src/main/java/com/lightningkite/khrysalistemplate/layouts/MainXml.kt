//
// MainXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class MainXml {

    lateinit var mainBack: ImageButton
    lateinit var title: TextView
    lateinit var mainContent: com.lightningkite.khrysalis.views.android.SwapView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.main, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        mainBack = view.findViewById<ImageButton>(R.id.mainBack)
        title = view.findViewById<TextView>(R.id.title)
        mainContent = view.findViewById<com.lightningkite.khrysalis.views.android.SwapView>(R.id.mainContent)
        
        
        return view
    }
}