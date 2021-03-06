//
// LoginDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class LoginDemoXml {

    lateinit var username: EditText
    lateinit var password: EditText
    lateinit var verifyPassword: EditText
    lateinit var agree: CheckBox
    lateinit var submitLoading: ViewFlipper
    lateinit var submit: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.login_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        username = view.findViewById<EditText>(R.id.username)
        password = view.findViewById<EditText>(R.id.password)
        verifyPassword = view.findViewById<EditText>(R.id.verifyPassword)
        agree = view.findViewById<CheckBox>(R.id.agree)
        submitLoading = view.findViewById<ViewFlipper>(R.id.submitLoading)
        submit = view.findViewById<Button>(R.id.submit)
        
        
        
        return view
    }
}