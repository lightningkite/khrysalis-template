//
// SwitchManiaXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class SwitchManiaXml {

    lateinit var editableText: EditText
    lateinit var editableTextCopy: TextView
    lateinit var editableTextBig: com.lightningkite.kwift.views.actual.MultilineEditText
    lateinit var spinner: Spinner
    lateinit var recyclerView: android.support.v7.widget.RecyclerView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.switch_mania, null, false)
        editableText = view.findViewById<EditText>(R.id.editableText)
        editableTextCopy = view.findViewById<TextView>(R.id.editableTextCopy)
        editableTextBig = view.findViewById<com.lightningkite.kwift.views.actual.MultilineEditText>(R.id.editableTextBig)
        spinner = view.findViewById<Spinner>(R.id.spinner)
        recyclerView = view.findViewById<android.support.v7.widget.RecyclerView>(R.id.recyclerView)
        return view
    }
}