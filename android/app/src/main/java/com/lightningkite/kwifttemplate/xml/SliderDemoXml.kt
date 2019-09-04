//
// SliderDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import android.widget.SeekBar
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class SliderDemoXml {

    lateinit var slider: SeekBar
    lateinit var valueDisplay: TextView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.slider_demo, null, false)
        slider = view.findViewById<SeekBar>(R.id.slider)
        valueDisplay = view.findViewById<TextView>(R.id.valueDisplay)
        return view
    }
}
