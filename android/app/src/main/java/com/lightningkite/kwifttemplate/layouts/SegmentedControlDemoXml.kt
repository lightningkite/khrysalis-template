//
// SegmentedControlDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class SegmentedControlDemoXml {

    lateinit var tabs: com.google.android.material.tabs.TabLayout
    lateinit var tabs2: com.google.android.material.tabs.TabLayout


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.segmented_control_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        tabs = view.findViewById<com.google.android.material.tabs.TabLayout>(R.id.tabs)
        tabs2 = view.findViewById<com.google.android.material.tabs.TabLayout>(R.id.tabs2)

        return view
    }
}
