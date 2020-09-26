//
// DateButtonDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class DateButtonDemoXml {

    lateinit var text: TextView
    lateinit var dateButton: com.lightningkite.butterfly.views.widget.DateButton
    lateinit var timeButton: com.lightningkite.butterfly.views.widget.TimeButton
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_button_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        text = view.findViewById<TextView>(R.id.text)
        dateButton = view.findViewById<com.lightningkite.butterfly.views.widget.DateButton>(R.id.dateButton)
        timeButton = view.findViewById<com.lightningkite.butterfly.views.widget.TimeButton>(R.id.timeButton)
        
        
        
        return view
    }
}