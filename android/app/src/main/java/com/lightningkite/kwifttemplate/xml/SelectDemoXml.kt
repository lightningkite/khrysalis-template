//
// SelectDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class SelectDemoXml {

    lateinit var list: android.support.v7.widget.RecyclerView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.select_demo, null, false)
        list = view.findViewById<android.support.v7.widget.RecyclerView>(R.id.list)
        return view
    }
}
