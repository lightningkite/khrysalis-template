package com.lightningkite.khrysalistemplate.vg

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.*
import com.lightningkite.khrysalis.bluetooth.Ble
import com.lightningkite.khrysalis.bluetooth.PropertyBleCharacteristicServer
import com.lightningkite.khrysalis.lifecycle.and
import com.lightningkite.khrysalis.lifecycle.appInForeground
import com.lightningkite.khrysalis.lifecycle.closeWhenOff
import com.lightningkite.khrysalis.lifecycle.lifecycle
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalis.observables.*
import com.lightningkite.khrysalis.observables.binding.*
import com.lightningkite.khrysalistemplate.R
import com.lightningkite.khrysalistemplate.layouts.*
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
