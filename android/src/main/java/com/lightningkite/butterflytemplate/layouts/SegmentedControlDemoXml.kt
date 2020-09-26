//
// SegmentedControlDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class SegmentedControlDemoXml {

    lateinit var tabs: com.google.android.material.tabs.TabLayout
    lateinit var tabs2: com.google.android.material.tabs.TabLayout
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.segmented_control_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        tabs = view.findViewById<com.google.android.material.tabs.TabLayout>(R.id.tabs)
        tabs2 = view.findViewById<com.google.android.material.tabs.TabLayout>(R.id.tabs2)
        
        
        
        return view
    }
}