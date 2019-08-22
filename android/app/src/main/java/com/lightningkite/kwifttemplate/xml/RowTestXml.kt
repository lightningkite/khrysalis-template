//
// RowTestXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class RowTestXml {

    lateinit var label: TextView
    lateinit var button: Button

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.row_test, null, false)
        label = view.findViewById<TextView>(R.id.label)
        button = view.findViewById<Button>(R.id.button)
        return view
    }
}