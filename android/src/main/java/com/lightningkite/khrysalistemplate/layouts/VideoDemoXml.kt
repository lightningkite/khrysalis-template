//
// VideoDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class VideoDemoXml {

    lateinit var video: com.lightningkite.khrysalis.views.VideoPlayer
    lateinit var thumbnail: ImageView
    lateinit var play: Button
    lateinit var gallery: Button
    lateinit var camera: Button
    lateinit var galleryMulti: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.video_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        video = view.findViewById<com.lightningkite.khrysalis.views.VideoPlayer>(R.id.video)
        thumbnail = view.findViewById<ImageView>(R.id.thumbnail)
        play = view.findViewById<Button>(R.id.play)
        gallery = view.findViewById<Button>(R.id.gallery)
        camera = view.findViewById<Button>(R.id.camera)
        galleryMulti = view.findViewById<Button>(R.id.galleryMulti)
        
        
        
        return view
    }
}