//
// PreviewXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

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