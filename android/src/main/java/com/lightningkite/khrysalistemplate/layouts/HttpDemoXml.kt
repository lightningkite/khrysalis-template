//
// HttpDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class HttpDemoXml {

    lateinit var items: com.lightningkite.khrysalis.views.android.VerticalRecyclerView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.http_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        items = view.findViewById<com.lightningkite.khrysalis.views.android.VerticalRecyclerView>(R.id.items)
        
        
        
        return view
    }
}