//
// HttpDemoVG.swift
// Created by Khrysalis Prototype Generator
// Sections of this file can be replaces if the marker, '(overwritten on flow generation)', is left in place.
//
package com.lightningkite.khrysalistemplate.vg

//--- Imports

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.*
import com.lightningkite.khrysalis.net.HttpClient
import com.lightningkite.khrysalis.net.readJson
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalis.observables.*
import com.lightningkite.khrysalis.observables.binding.*
import com.lightningkite.khrysalistemplate.R
import com.lightningkite.khrysalistemplate.layouts.*
import io.reactivex.Observable
import io.reactivex.Single

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
    override fun generate(dependency: ViewDependency): View {
        val xml = HttpDemoXml()
        val view = xml.setup(dependency)
        
        //--- Set Up xml.items
        xml.items.bind(
            data = HttpClient.call("https://jsonplaceholder.typicode.com/posts/")
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
