//
// FloatingHexagonsDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.CustomView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class FloatingHexagonsDemoXml {

    lateinit var customView: com.lightningkite.kwift.views.actual.CustomView
    lateinit var customViewDelegate: com.lightningkite.kwifttemplate.shared.views.FloatingHexagonsDelegate

    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.floating_hexagons_demo, null, false)
        return setup(view)
    }

    fun setup(view: View): View {
        xmlRoot = view
        customView = view.findViewById<com.lightningkite.kwift.views.actual.CustomView>(R.id.customView)
        customViewDelegate =
            view.findViewById<CustomView>(R.id.customView).delegate as com.lightningkite.kwifttemplate.shared.views.FloatingHexagonsDelegate

        return view
    }
}