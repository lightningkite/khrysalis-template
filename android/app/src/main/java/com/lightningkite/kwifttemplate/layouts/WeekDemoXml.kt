//
// WeekDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class WeekDemoXml {

    lateinit var week: com.lightningkite.kwift.views.android.WeekView


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.week_demo, null, false)
        return setup(view)
    }

    fun setup(view: View): View {
        week = view.findViewById<com.lightningkite.kwift.views.android.WeekView>(R.id.week)

        return view
    }
}
