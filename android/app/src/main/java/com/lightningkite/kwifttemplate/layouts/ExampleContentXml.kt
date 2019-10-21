//
// ExampleContentXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class ExampleContentXml {

    lateinit var exampleContentNumber: TextView
    lateinit var exampleContentIncrement: Button

    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.example_content, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        exampleContentNumber = view.findViewById<TextView>(R.id.exampleContentNumber)
        exampleContentIncrement = view.findViewById<Button>(R.id.exampleContentIncrement)

        return view
    }
}
