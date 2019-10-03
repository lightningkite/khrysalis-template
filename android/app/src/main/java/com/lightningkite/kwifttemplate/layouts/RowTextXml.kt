//
// RowTextXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class RowTextXml {

    lateinit var label: TextView


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.row_text, null, false)
        return setup(view)
    }

    fun setup(view: View): View {
        label = view.findViewById<TextView>(R.id.label)

        return view
    }
}
