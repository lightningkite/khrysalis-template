//
// WebsocketDemoVG.swift
// Created by Khrysalis Prototype Generator
// Sections of this file can be replaces if the marker, '(overwritten on flow generation)', is left in place.
//
package com.lightningkite.khrysalistemplate.vg

//--- Imports

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.*
import com.lightningkite.khrysalis.lifecycle.lifecycle
import com.lightningkite.khrysalis.net.HttpClient
import com.lightningkite.khrysalis.net.WebSocketFrame
import com.lightningkite.khrysalis.net.webSocket
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalis.observables.*
import com.lightningkite.khrysalis.observables.binding.*
import com.lightningkite.khrysalistemplate.R
import com.lightningkite.khrysalistemplate.layouts.*
import io.reactivex.Observable
import io.reactivex.Single

//--- Name (overwritten on flow generation)
@Suppress("NAME_SHADOWING")
class WebsocketDemoVG(
        //--- Dependencies (overwritten on flow generation)
        //--- Extends (overwritten on flow generation)
) : ViewGenerator() {


    //--- Title (overwritten on flow generation)
    override val title: String get() = "Websocket Demo"

    //--- Data
    val socket = HttpClient.webSocket("wss://echo.websocket.org").toObservable().publish().refCount()
    val text = StandardObservableProperty("")

    //--- Generate Start (overwritten on flow generation)
    override fun generate(dependency: ViewDependency): View {
        val xml = WebsocketDemoXml()
        val view = xml.setup(dependency)

        //--- Set Up xml.items (overwritten on flow generation)
        xml.items.bind(
                data = socket.switchMap { it -> it.read }.buffer(5, 1).asObservableProperty(listOf()),
                defaultValue = WebSocketFrame(),
                makeView = label@{ observable ->
                    //--- Make Subview For xml.items (overwritten on flow generation)
                    val cellXml = ComponentTextXml()
                    val cellView = cellXml.setup(dependency)

                    //--- Set Up cellXml.label (overwritten on flow generation)
                    cellXml.label.bindString(observable.map { it -> it.text ?: "---" })
                    //--- End Make Subview For xml.items (overwritten on flow generation)
                    return@label cellView
                }
        )

        //--- Set Up xml.input
        xml.input.bindString(text)

        //--- Set Up xml.submit
        xml.submit.onClick {
            socket.take(1).subscribe { it -> it.writeText(this.text.value) }
        }

        //--- Generate End (overwritten on flow generation)

        return view
    }

    //--- Init

    init {
        //--- Init End
    }

    //--- Actions


    //--- Action submitClick (overwritten on flow generation)
    fun submitClick() {
    }

    //--- Body End
}
