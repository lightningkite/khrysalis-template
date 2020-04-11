package com.lightningkite.khrysalistemplate.vg

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.*
import com.lightningkite.khrysalis.bluetooth.Ble
import com.lightningkite.khrysalis.bluetooth.BleCharacteristic
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

//        val connection = Ble.connect(dependency, deviceId).flatMap { it ->it.notify(
//            BleCharacteristic(
//                serviceUuid = UUID.fromString("7eab90f5-7c6e-4152-ab3e-9d4ebe39ac1c"),
//                characteristicUuid = UUID.fromString("7b476b68-50fa-4d13-b2fc-e54f8a299212")
//            )
//        ) }

//        xml.charValue.bindString(connection.map { it -> it) }.asObservableProperty("Not loaded"))

        return view
    }
}
