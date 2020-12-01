@file:SharedCode
//
// BleServerDemoVG.swift
// Created by Khrysalis Prototype Generator
// Sections of this file can be replaces if the marker, '(overwritten on flow generation)', is left in place.
//
package com.lightningkite.butterflytemplate.vg

//--- Imports

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterfly.bluetooth.BleCharacteristicProperties
import com.lightningkite.butterfly.bluetooth.BleServerDelegate
import com.lightningkite.butterfly.bluetooth.bleServer
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.observables.*
import com.lightningkite.butterfly.observables.binding.*
import com.lightningkite.butterfly.rx.DisposableLambda
import com.lightningkite.butterfly.rx.removed
import com.lightningkite.butterfly.rx.until
import com.lightningkite.butterflytemplate.R
import com.lightningkite.butterflytemplate.layouts.*
import java.util.*

//--- Name (overwritten on flow generation)
@Suppress("NAME_SHADOWING")
class BleServerDemoVG(
    //--- Dependencies (overwritten on flow generation)
    //--- Extends (overwritten on flow generation)
) : ViewGenerator() {
    
    
    //--- Title (overwritten on flow generation)
    override val title: String get() = "Ble Server Demo"
    
    //--- Properties
    val utfValue = StandardObservableProperty("")
    val server = mapOf(UUID.randomUUID() to BleServerDelegate.PerCharacteristic.Service(
        debugName = "Test Service",
        primary = true,
        delegates = mapOf(
            UUID.randomUUID() to BleServerDelegate.PerCharacteristic.FromProperty(
                debugName = "utfValue",
                property = utfValue.map(
                    read = { it.toByteArray(Charsets.UTF_8) },
                    write = { it.toString(Charsets.UTF_8) }
                )
            )
        )
    ))
    
    //--- Generate Start (overwritten on flow generation)
    override fun generate(dependency: ActivityAccess): View {
        val xml = BleServerDemoXml()
        val view = xml.setup(dependency)
        
        //--- Set Up xml.info
        xml.info.text = """
            Service: ${server.keys.first()}
            Characteristic: ${server.values.first().delegates.keys.first()}
        """.trimIndent()
        
        //--- Server!
        dependency.bleServer(BleServerDelegate.PerCharacteristic(
            mapOf(UUID.randomUUID() to BleServerDelegate.PerCharacteristic.Service(
                debugName = "Test Service",
                primary = true,
                delegates = mapOf(
                    UUID.randomUUID() to BleServerDelegate.PerCharacteristic.FromProperty(
                        debugName = "utfValue",
                        property = utfValue.map(
                            read = { it.toByteArray(Charsets.UTF_8) },
                            write = { it.toString(Charsets.UTF_8) }
                        )
                    )
                )
            ))
        )).apply { advertising = true }.until(view.removed)
        
        //--- Set Up xml.utfValue
        xml.utfValue.bindString(utfValue)
        
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
