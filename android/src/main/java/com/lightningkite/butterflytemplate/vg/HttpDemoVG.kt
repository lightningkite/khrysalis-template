//! This file will translate using Khrysalis.
//
// HttpDemoVG.swift
// Created by Butterfly Prototype Generator
// Sections of this file can be replaces if the marker, '(overwritten on flow generation)', is left in place.
//
package com.lightningkite.butterflytemplate.vg

//--- Imports

import android.view.View
import com.lightningkite.butterfly.Codable
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.net.HttpClient
import com.lightningkite.butterfly.net.readJson
import com.lightningkite.butterfly.observables.asObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindFloat
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.ComponentTextXml
import com.lightningkite.butterflytemplate.layouts.HttpDemoXml

//--- Name (overwritten on flow generation)
@Suppress("NAME_SHADOWING")
class HttpDemoVG(
    //--- Dependencies (overwritten on flow generation)
    //--- Extends (overwritten on flow generation)
) : ViewGenerator() {
    
    
    //--- Title (overwritten on flow generation)
    override val title: String get() = "Http Demo"
    
    //--- Data
    data class Post(val userId: Long, val id: Long, val title: String, val body: String): Codable

    //--- Generate Start (overwritten on flow generation)
    override fun generate(dependency: ActivityAccess): View {
        val xml = HttpDemoXml()
        val view = xml.setup(dependency)
        
        //--- Call
        val pair = HttpClient.callWithProgress("https://jsonplaceholder.typicode.com/posts/")
        val progress = pair.first
        val call = pair.second

        //--- Set Up xml.progress
        xml.progress.bindFloat(progress.map { it.approximate })

        //--- Set Up xml.items
        xml.items.bind(
            data = call
                .readJson<List<Post>>()
                .toObservable()
                .asObservableProperty(listOf(Post(0, 0, "Loading...", "-"))),
            defaultValue = Post(0, 0, "Default", "Failure"),
            makeView = label@ { observable ->
                //--- Make Subview For xml.items
                val cellXml = ComponentTextXml()
                val cellView = cellXml.setup(dependency)

                //--- Set Up cellXml.label
                cellXml.label.bindString(observable.map { it -> it.title })
                //--- End Make Subview For xml.items
                return@label cellView
            }
        )

        //--- Generate End (overwritten on flow generation)
        
        return view
    }
    
    //--- Init

    init {
    //--- Init End
    }

    //--- Actions


    //--- Body End
}