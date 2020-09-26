//
// PongDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class PongDemoXml {

    lateinit var customView: com.lightningkite.butterfly.views.widget.CustomView
    lateinit var customViewDelegate: com.lightningkite.butterflytemplate.vg.PongDelegate
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.pong_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        customView = view.findViewById<com.lightningkite.butterfly.views.widget.CustomView>(R.id.customView)
        customViewDelegate = view.findViewById<CustomView>(R.id.customView).delegate as com.lightningkite.butterflytemplate.vg.PongDelegate
        
        
        return view
    }
}