//
// ExampleContentXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class ExampleContentXml {

    lateinit var exampleContentNumber: TextView
    lateinit var exampleContentIncrement: Button
    lateinit var exampleContentGoToAnotherScreen: Button

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.example_content, null, false)
        exampleContentNumber = view.findViewById<TextView>(R.id.exampleContentNumber)
        exampleContentIncrement = view.findViewById<Button>(R.id.exampleContentIncrement)
        exampleContentGoToAnotherScreen =
            view.findViewById<Button>(R.id.exampleContentGoToAnotherScreen)
        return view
    }
}