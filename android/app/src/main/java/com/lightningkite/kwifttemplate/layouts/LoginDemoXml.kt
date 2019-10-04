//
// LoginDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class LoginDemoXml {

    lateinit var username: EditText
    lateinit var password: EditText
    lateinit var verifyPassword: EditText
    lateinit var agree: CheckBox
    lateinit var submit: Button


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.login_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        username = view.findViewById<EditText>(R.id.username)
        password = view.findViewById<EditText>(R.id.password)
        verifyPassword = view.findViewById<EditText>(R.id.verifyPassword)
        agree = view.findViewById<CheckBox>(R.id.agree)
        submit = view.findViewById<Button>(R.id.submit)

        return view
    }
}
