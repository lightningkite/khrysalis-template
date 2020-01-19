package com.lightningkite.kwifttemplate.vg

import android.widget.*
import android.view.*
import com.lightningkite.kwift.*
import com.lightningkite.kwift.bluetooth.Ble
import com.lightningkite.kwift.bluetooth.PropertyBleCharacteristicServer
import com.lightningkite.kwift.lifecycle.and
import com.lightningkite.kwift.lifecycle.appInForeground
import com.lightningkite.kwift.lifecycle.closeWhenOff
import com.lightningkite.kwift.lifecycle.lifecycle
import com.lightningkite.kwift.views.*
import com.lightningkite.kwift.observables.*
import com.lightningkite.kwift.observables.binding.*
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwifttemplate.layouts.*
import java.util.*

@Suppress("NAME_SHADOWING")
class BleClientDemoVG(val deviceId: String) : ViewGenerator() {

    override val title: String get() = "BleHostDemo"
    override fun generate(dependency: ViewDependency): View {
        val xml = BleClientDemoXml()
        val view = xml.setup(dependency)

        //OpenConnectionObservable -> Event -> Observable
        //Is a DRF just an event?!
        //Ble.connect(dependency, deviceId).flatMap { it?.subscribe() }.asObservable(default = "")

//        xml.status.bindString(server.clients.map { it -> "Serving ${it.size} clients" })
//        xml.charValue.bindString(characteristic.map(
//            read = { it -> it.toString(Charsets.UTF_8) },
//            write = { it -> it.toByteArray(Charsets.UTF_8) }
//        ))

        return view
    }
}
