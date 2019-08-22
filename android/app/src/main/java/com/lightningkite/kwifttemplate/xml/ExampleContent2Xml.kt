//
// ExampleContent2Xml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class ExampleContent2Xml {


    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.example_content2, null, false)

        return view
    }
}