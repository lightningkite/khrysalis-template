//
// MainXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class MainXml {

    lateinit var mainBack: ImageButton
    lateinit var title: TextView
    lateinit var mainContent: FrameLayout


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.main, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        mainBack = view.findViewById<ImageButton>(R.id.mainBack)
        title = view.findViewById<TextView>(R.id.title)
        mainContent = view.findViewById<FrameLayout>(R.id.mainContent)

        return view
    }
}