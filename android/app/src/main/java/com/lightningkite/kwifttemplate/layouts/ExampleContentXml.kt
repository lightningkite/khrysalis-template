//
// ExampleContentXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class ExampleContentXml {

    lateinit var exampleContentNumber: TextView
    lateinit var exampleContentIncrement: Button
    lateinit var chainedNumber: TextView
    lateinit var chainedIncrement: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.example_content, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        exampleContentNumber = view.findViewById<TextView>(R.id.exampleContentNumber)
        exampleContentIncrement = view.findViewById<Button>(R.id.exampleContentIncrement)
        chainedNumber = view.findViewById<TextView>(R.id.chainedNumber)
        chainedIncrement = view.findViewById<Button>(R.id.chainedIncrement)
        
        
        return view
    }
}