//
// ViewPagerDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class ViewPagerDemoXml {

    lateinit var viewPager: androidx.viewpager.widget.ViewPager
    lateinit var viewPagerIndicator: com.rd.PageIndicatorView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.view_pager_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        viewPager = view.findViewById<androidx.viewpager.widget.ViewPager>(R.id.viewPager)
        viewPagerIndicator = view.findViewById<com.rd.PageIndicatorView>(R.id.viewPagerIndicator)
        
        
        
        return view
    }
}