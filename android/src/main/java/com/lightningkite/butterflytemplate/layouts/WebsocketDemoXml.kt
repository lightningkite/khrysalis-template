//
// WebsocketDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class WebsocketDemoXml {

    lateinit var items: com.lightningkite.butterfly.views.widget.VerticalRecyclerView
    lateinit var input: EditText
    lateinit var submit: ImageButton
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.websocket_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        items = view.findViewById<com.lightningkite.butterfly.views.widget.VerticalRecyclerView>(R.id.items)
        input = view.findViewById<EditText>(R.id.input)
        submit = view.findViewById<ImageButton>(R.id.submit)
        
        
        
        return view
    }
}