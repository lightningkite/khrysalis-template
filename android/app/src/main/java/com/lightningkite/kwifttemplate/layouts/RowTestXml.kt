//
// RowTestXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class RowTestXml {

    lateinit var label: TextView
    lateinit var button: Button


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.row_test, null, false)
        return setup(view)
    }

    fun setup(view: View): View {
        label = view.findViewById<TextView>(R.id.label)
        button = view.findViewById<Button>(R.id.button)

        return view
    }
}
