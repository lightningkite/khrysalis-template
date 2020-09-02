//
// LoadImageDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class LoadImageDemoXml {

    lateinit var gallery: Button
    lateinit var galleryMultiple: Button
    lateinit var camera: Button
    lateinit var loremPixel: Button
    lateinit var image: ImageView
    lateinit var checkCanUpload: Button
    lateinit var canUpload: TextView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.load_image_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        gallery = view.findViewById<Button>(R.id.gallery)
        galleryMultiple = view.findViewById<Button>(R.id.galleryMultiple)
        camera = view.findViewById<Button>(R.id.camera)
        loremPixel = view.findViewById<Button>(R.id.lorem_pixel)
        image = view.findViewById<ImageView>(R.id.image)
        checkCanUpload = view.findViewById<Button>(R.id.checkCanUpload)
        canUpload = view.findViewById<TextView>(R.id.canUpload)
        
        
        
        return view
    }
}