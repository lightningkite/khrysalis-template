//
// MainXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class MainXml {

    lateinit var topBar: LinearLayout
    lateinit var mainBack: ImageButton
    lateinit var title: TextView
    lateinit var mainContent: com.lightningkite.khrysalis.views.android.SwapView
    lateinit var bottom0: View
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.main, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        topBar = view.findViewById<LinearLayout>(R.id.topBar)
        mainBack = view.findViewById<ImageButton>(R.id.mainBack)
        title = view.findViewById<TextView>(R.id.title)
        mainContent = view.findViewById<com.lightningkite.khrysalis.views.android.SwapView>(R.id.mainContent)
        bottom0 = view.findViewById<View>(R.id.bottom0)
        
        
        topBar.safeInsets(11)
        bottom0.safeInsetsSizing(14)
        return view
    }
}