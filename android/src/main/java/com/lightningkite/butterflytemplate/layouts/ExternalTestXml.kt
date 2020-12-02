//
// ExternalTestXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class ExternalTestXml {

    lateinit var scrollView: ScrollView
    lateinit var openMap: Button
    lateinit var openWeb: Button
    lateinit var openEvent: Button
    lateinit var pickImage: Button
    lateinit var pickImages: Button
    lateinit var pickVideo: Button
    lateinit var pickVideos: Button
    lateinit var pickMedia: Button
    lateinit var pickMedias: Button
    lateinit var pickFile: Button
    lateinit var pickFiles: Button
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.external_test, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        scrollView = view.findViewById<ScrollView>(R.id.scrollView)
        openMap = view.findViewById<Button>(R.id.openMap)
        openWeb = view.findViewById<Button>(R.id.openWeb)
        openEvent = view.findViewById<Button>(R.id.openEvent)
        pickImage = view.findViewById<Button>(R.id.pick_image)
        pickImages = view.findViewById<Button>(R.id.pick_images)
        pickVideo = view.findViewById<Button>(R.id.pick_video)
        pickVideos = view.findViewById<Button>(R.id.pick_videos)
        pickMedia = view.findViewById<Button>(R.id.pick_media)
        pickMedias = view.findViewById<Button>(R.id.pick_medias)
        pickFile = view.findViewById<Button>(R.id.pick_file)
        pickFiles = view.findViewById<Button>(R.id.pick_files)
        
        
        
        return view
    }
}