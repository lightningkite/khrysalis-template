//
// WeekDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class WeekDemoXml {

    lateinit var week: com.alamkanak.weekview.WeekView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.week_demo, null, false)
        week = view.findViewById<com.alamkanak.weekview.WeekView>(R.id.week)
        return view
    }
}
