//
// HttpDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class HttpDemoXml {

    lateinit var progress: com.lightningkite.butterfly.views.widget.HorizontalProgressBar
    lateinit var items: com.lightningkite.butterfly.views.widget.VerticalRecyclerView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.http_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        progress = view.findViewById<com.lightningkite.butterfly.views.widget.HorizontalProgressBar>(R.id.progress)
        items = view.findViewById<com.lightningkite.butterfly.views.widget.VerticalRecyclerView>(R.id.items)
        
        
        
        return view
    }
}