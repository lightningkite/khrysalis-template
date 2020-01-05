//
// MarginTestsXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.*
import com.lightningkite.kwifttemplate.R

class MarginTestsXml {

    
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.margin_tests, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        
        
        
        return view
    }
}