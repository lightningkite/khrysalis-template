//
// LoginDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.CheckBox
import android.widget.EditText
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class LoginDemoXml {

    lateinit var username: EditText
    lateinit var password: EditText
    lateinit var verifyPassword: EditText
    lateinit var agree: CheckBox
    lateinit var submit: Button

    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.login_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        username = view.findViewById<EditText>(R.id.username)
        password = view.findViewById<EditText>(R.id.password)
        verifyPassword = view.findViewById<EditText>(R.id.verifyPassword)
        agree = view.findViewById<CheckBox>(R.id.agree)
        submit = view.findViewById<Button>(R.id.submit)

        return view
    }
}
