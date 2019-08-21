//
// MainXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class MainXml {

    lateinit var boundViewMainBack: ImageButton
    lateinit var boundViewTitle: TextView
    lateinit var boundViewMainContent: FrameLayout

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.main, null, false)
        boundViewMainBack = view.findViewById<ImageButton>(R.id.mainBack)
        boundViewTitle = view.findViewById<TextView>(R.id.title)
        boundViewMainContent = view.findViewById<FrameLayout>(R.id.mainContent)
        return view
    }
}
