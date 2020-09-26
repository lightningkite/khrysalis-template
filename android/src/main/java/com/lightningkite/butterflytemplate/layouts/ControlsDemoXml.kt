//
// ControlsDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class ControlsDemoXml {

    lateinit var editableText: EditText
    lateinit var numberText: EditText
    lateinit var editableAutoText: AutoCompleteTextView
    lateinit var editableTextCopy: TextView
    lateinit var editableTextBig: com.lightningkite.butterfly.views.widget.MultilineEditText
    lateinit var spinner: Spinner
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.controls_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        editableText = view.findViewById<EditText>(R.id.editableText)
        numberText = view.findViewById<EditText>(R.id.numberText)
        editableAutoText = view.findViewById<AutoCompleteTextView>(R.id.editableAutoText)
        editableTextCopy = view.findViewById<TextView>(R.id.editableTextCopy)
        editableTextBig = view.findViewById<com.lightningkite.butterfly.views.widget.MultilineEditText>(R.id.editableTextBig)
        spinner = view.findViewById<Spinner>(R.id.spinner)
        
        
        
        return view
    }
}