//! This file will translate using Khrysalis.
//
// VideoDemoVG.swift
// Created by Butterfly Prototype Generator
// Sections of this file can be replaces if the marker, '(overwritten on flow generation)', is left in place.
//
package com.lightningkite.butterflytemplate.vg

//--- Imports

import android.view.View
import com.lightningkite.butterfly.Video
import com.lightningkite.butterfly.VideoReference
import com.lightningkite.butterfly.VideoRemoteUrl
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindVideoThumbnail
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterflytemplate.layouts.VideoDemoXml

//--- Name (overwritten on flow generation)
@Suppress("NAME_SHADOWING")
class VideoDemoVG(
    //--- Dependencies (overwritten on flow generation)
    //--- Extends (overwritten on flow generation)
) : ViewGenerator() {
    
    
    //--- Title (overwritten on flow generation)
    override val title: String get() = "Video Demo"
    
    //--- Properties
    val currentVideo = StandardObservableProperty<Video?>(VideoRemoteUrl("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"))
    val timesPlayPressed = StandardObservableProperty<Int>(0)

    //--- Generate Start (overwritten on flow generation)
    override fun generate(dependency: ActivityAccess): View {
        val xml = VideoDemoXml()
        val view = xml.setup(dependency)
        
        //--- Set Up xml.video
        xml.video.bind(currentVideo)
        
        //--- Set Up xml.thumbnail
        xml.thumbnail.bindVideoThumbnail(currentVideo)
        
        //--- Set Up xml.play (overwritten on flow generation)
        xml.play.onClick { this.playClick() }
        
        //--- Set Up xml.gallery
        xml.gallery.onClick {
            dependency.requestVideoGallery {
                currentVideo.value = VideoReference(it)
            }
        }
        
        //--- Set Up xml.camera
        xml.camera.onClick {
            dependency.requestVideoCamera {
                currentVideo.value = VideoReference(it)
            }
        }
        
        //--- Set Up xml.galleryMulti
        xml.galleryMulti.onClick {
            dependency.requestVideosGallery {
                it.firstOrNull()?.let {
                    currentVideo.value = VideoReference(it)
                }
            }
        }
        
        //--- Generate End (overwritten on flow generation)
        
        return view
    }
    
    //--- Init
    
    init {
    //--- Init End
    }
    
    //--- Actions
    
    //--- Action playClick
    fun playClick() {
        timesPlayPressed.value++
        when(timesPlayPressed.value % 3) {
            0 -> currentVideo.value = VideoRemoteUrl("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
            1 -> currentVideo.value = VideoRemoteUrl("https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
            2 -> currentVideo.value = null
        }
    }
    
    //--- Action galleryClick
    
    //--- Action cameraClick (overwritten on flow generation)
    fun cameraClick() {
    }
    //--- Action galleryMultiClick (overwritten on flow generation)
    fun galleryMultiClick() {
    }
    
    //--- Body End
}
