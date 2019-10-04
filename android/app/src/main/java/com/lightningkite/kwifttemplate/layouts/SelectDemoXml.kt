//
// SelectDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class SelectDemoXml {

    lateinit var list: androidx.recyclerview.widget.RecyclerView


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.select_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        list = view.findViewById<androidx.recyclerview.widget.RecyclerView>(R.id.list)

        return view
    }
}
