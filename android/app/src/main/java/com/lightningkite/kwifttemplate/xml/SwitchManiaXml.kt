//
// SwitchManiaXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import android.widget.EditText
import android.widget.Spinner
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class SwitchManiaXml {

    lateinit var editableText: EditText
    lateinit var editableTextCopy: TextView
    lateinit var editableTextBig: com.lightningkite.kwift.views.android.MultilineEditText
    lateinit var spinner: Spinner
    lateinit var recyclerView: android.support.v7.widget.RecyclerView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.switch_mania, null, false)
        editableText = view.findViewById<EditText>(R.id.editableText)
        editableTextCopy = view.findViewById<TextView>(R.id.editableTextCopy)
        editableTextBig = view.findViewById<com.lightningkite.kwift.views.android.MultilineEditText>(R.id.editableTextBig)
        spinner = view.findViewById<Spinner>(R.id.spinner)
        recyclerView = view.findViewById<android.support.v7.widget.RecyclerView>(R.id.recyclerView)
        return view
    }
}
