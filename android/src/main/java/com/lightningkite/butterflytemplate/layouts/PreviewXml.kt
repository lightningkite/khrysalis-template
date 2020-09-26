//
// PreviewXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class PreviewXml {

    lateinit var viewName: TextView
    lateinit var pager: androidx.viewpager.widget.ViewPager
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
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