//
// ControlsDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.EditText
import android.widget.Spinner
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class ControlsDemoXml {

    lateinit var editableText: EditText
    lateinit var editableTextCopy: TextView
    lateinit var editableTextBig: com.lightningkite.kwift.views.android.MultilineEditText
    lateinit var spinner: Spinner


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.controls_demo, null, false)
        return setup(view)
    }

    fun setup(view: View): View {
        editableText = view.findViewById<EditText>(R.id.editableText)
        editableTextCopy = view.findViewById<TextView>(R.id.editableTextCopy)
        editableTextBig =
            view.findViewById<com.lightningkite.kwift.views.android.MultilineEditText>(R.id.editableTextBig)
        spinner = view.findViewById<Spinner>(R.id.spinner)

        return view
    }
}
