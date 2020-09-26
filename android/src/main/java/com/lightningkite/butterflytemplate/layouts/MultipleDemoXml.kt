//
// MultipleDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class MultipleDemoXml {

    lateinit var list: androidx.recyclerview.widget.RecyclerView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.multiple_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        list = view.findViewById<androidx.recyclerview.widget.RecyclerView>(R.id.list)
        
        
        
        return view
    }
}