//
// MarginTestXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class MarginTestXml {

    lateinit var scrollView: ScrollView
    lateinit var scrollToTop: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.margin_test, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        scrollView = view.findViewById<ScrollView>(R.id.scrollView)
        scrollToTop = view.findViewById<Button>(R.id.scrollToTop)
        
        
        
        return view
    }
}