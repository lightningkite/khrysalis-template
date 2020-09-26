//! This file will translate using Khrysalis.
//
// WebsocketDemoVG.swift
// Created by Butterfly Prototype Generator
// Sections of this file can be replaces if the marker, '(overwritten on flow generation)', is left in place.
//
package com.lightningkite.butterflytemplate.vg

//--- Imports

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.net.ConnectedWebSocket
import com.lightningkite.butterfly.net.HttpClient
import com.lightningkite.butterfly.net.WebSocketFrame
import com.lightningkite.butterfly.observables.ConstantObservableProperty
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.asObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.rx.removed
import com.lightningkite.butterfly.rx.until
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.onClick
import com.lightningkite.butterflytemplate.layouts.ComponentTextXml
import com.lightningkite.butterflytemplate.layouts.WebsocketDemoXml
import io.reactivex.Observable

//--- Name (overwritten on flow generation)
@Suppress("NAME_SHADOWING")
class WebsocketDemoVG(
    //--- Dependencies (overwritten on flow generation)
    //--- Extends (overwritten on flow generation)
) : ViewGenerator() {
    
    
    //--- Title (overwritten on flow generation)
    override val title: String get() = "Websocket Demo"
    
    //--- Data
    val socket: Observable<ConnectedWebSocket> = HttpClient.webSocket("wss://echo.websocket.org").replay(1).refCount()
    val text: StandardObservableProperty<String> = StandardObservableProperty("")

    //--- Generate Start (overwritten on flow generation)
    override fun generate(dependency: ActivityAccess): View {
        val xml = WebsocketDemoXml()
        val view = xml.setup(dependency)
        
        //--- Set Up xml.items
        val itemsList = ArrayList<WebSocketFrame>()
        xml.items.bind(
            data = socket.switchMap { it -> it.read }.map { it ->
                println("Adding item")
                itemsList.add(it)
                while (itemsList.size > 20) {
                    itemsList.removeAt(0)
                }
                return@map itemsList as List<WebSocketFrame>
            }.asObservableProperty(itemsList),
            defaultValue = WebSocketFrame(),
            makeView = label@{ observable ->
                //--- Make Subview For xml.items (overwritten on flow generation)
                val cellXml = ComponentTextXml()
                val cellView = cellXml.setup(dependency)
                
                //--- Set Up cellXml.label (overwritten on flow generation)
                cellXml.label.bindString(ConstantObservableProperty("Some Text"))
                //--- End Make Subview For xml.items (overwritten on flow generation)
                return@label cellView
            }
        )
        
        //--- Set Up xml.input
        xml.input.bindString(text)

        //--- Set Up xml.submit
        xml.submit.onClick {
            this.socket.take(1).subscribe { it -> it.onNext(WebSocketFrame(text = this.text.value)) }.until(xml.submit.removed)
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
