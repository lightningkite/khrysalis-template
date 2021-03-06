//
// ExampleContentXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class ExampleContentXml {

    lateinit var scrollView: ScrollView
    lateinit var exampleContentNumber: TextView
    lateinit var exampleContentIncrement: Button
    lateinit var chainedNumber: TextView
    lateinit var chainedIncrement: Button
    lateinit var scrollToTop: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.example_content, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        scrollView = view.findViewById<ScrollView>(R.id.scrollView)
        exampleContentNumber = view.findViewById<TextView>(R.id.exampleContentNumber)
        exampleContentIncrement = view.findViewById<Button>(R.id.exampleContentIncrement)
        chainedNumber = view.findViewById<TextView>(R.id.chainedNumber)
        chainedIncrement = view.findViewById<Button>(R.id.chainedIncrement)
        scrollToTop = view.findViewById<Button>(R.id.scrollToTop)
        
        
        
        return view
    }
}