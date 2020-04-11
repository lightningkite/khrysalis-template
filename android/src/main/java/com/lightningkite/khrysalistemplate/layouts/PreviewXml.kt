//
// PreviewXml.swift
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class PreviewXml {

    lateinit var viewName: TextView
    lateinit var pager: androidx.viewpager.widget.ViewPager
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.preview, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        viewName = view.findViewById<TextView>(R.id.viewName)
        pager = view.findViewById<androidx.viewpager.widget.ViewPager>(R.id.pager)
        
        
        
        return view
    }
}