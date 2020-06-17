//
// ComponentTestXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class ComponentTestXml {

    lateinit var label: TextView
    lateinit var button: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.component_test, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        label = view.findViewById<TextView>(R.id.label)
        button = view.findViewById<Button>(R.id.button)
        
        
        
        return view
    }
}