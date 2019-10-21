//
// LoadImageDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.kwift.views.actual.*
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R

class LoadImageDemoXml {

    lateinit var gallery: Button
    lateinit var camera: Button
    lateinit var image: ImageView
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.load_image_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        gallery = view.findViewById<Button>(R.id.gallery)
        camera = view.findViewById<Button>(R.id.camera)
        image = view.findViewById<ImageView>(R.id.image)
        
        return view
    }
}