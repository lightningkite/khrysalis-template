//
// ExternalTestXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class ExternalTestXml {

    lateinit var scrollView: ScrollView
    lateinit var openMap: Button
    lateinit var openWeb: Button
    lateinit var openEvent: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.external_test, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        scrollView = view.findViewById<ScrollView>(R.id.scrollView)
        openMap = view.findViewById<Button>(R.id.openMap)
        openWeb = view.findViewById<Button>(R.id.openWeb)
        openEvent = view.findViewById<Button>(R.id.openEvent)
        
        
        
        return view
    }
}