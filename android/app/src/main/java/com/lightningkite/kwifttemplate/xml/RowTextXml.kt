//
// RowTextXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class RowTextXml {

    lateinit var label: TextView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.row_text, null, false)
        label = view.findViewById<TextView>(R.id.label)
        return view
    }
}