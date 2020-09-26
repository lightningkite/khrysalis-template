//
// MarginTestXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class MarginTestXml {

    lateinit var scrollView: ScrollView
    lateinit var scrollToTop: Button
    lateinit var focusTest: EditText
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.margin_test, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        scrollView = view.findViewById<ScrollView>(R.id.scrollView)
        scrollToTop = view.findViewById<Button>(R.id.scrollToTop)
        focusTest = view.findViewById<EditText>(R.id.focusTest)
        
        
        focusTest.focusAtStartup = false
        return view
    }
}