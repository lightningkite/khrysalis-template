//
// WebsocketDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class WebsocketDemoXml {

    lateinit var items: com.lightningkite.khrysalis.views.android.VerticalRecyclerView
    lateinit var input: EditText
    lateinit var submit: ImageButton
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.websocket_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        items = view.findViewById<com.lightningkite.khrysalis.views.android.VerticalRecyclerView>(R.id.items)
        input = view.findViewById<EditText>(R.id.input)
        submit = view.findViewById<ImageButton>(R.id.submit)
        
        
        
        return view
    }
}