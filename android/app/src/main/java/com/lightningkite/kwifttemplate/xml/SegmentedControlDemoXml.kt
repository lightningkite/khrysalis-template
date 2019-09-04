//
// SegmentedControlDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class SegmentedControlDemoXml {

    lateinit var tabs: android.support.design.widget.TabLayout
    lateinit var tabs2: android.support.design.widget.TabLayout

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.segmented_control_demo, null, false)
        tabs = view.findViewById<android.support.design.widget.TabLayout>(R.id.tabs)
        tabs2 = view.findViewById<android.support.design.widget.TabLayout>(R.id.tabs2)
        return view
    }
}
