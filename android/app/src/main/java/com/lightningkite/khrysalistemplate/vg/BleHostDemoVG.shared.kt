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
import com.lightningkite.khrysalis.rx.removed
import com.lightningkite.khrysalis.rx.until
import com.lightningkite.khrysalistemplate.R
import com.lightningkite.khrysalistemplate.layouts.*
import java.util.*

@Suppress("NAME_SHADOWING")
class BleHostDemoVG(
) : ViewGenerator() {

    val characteristic: PropertyBleCharacteristicServer = PropertyBleCharacteristicServer(
        characteristic = BleCharacteristic(
            serviceUuid = UUID.fromString("7eab90f5-7c6e-4152-ab3e-9d4ebe39ac1c"),
            characteristicUuid = UUID.fromString("7b476b68-50fa-4d13-b2fc-e54f8a299212")
        ),
        value = byteArrayOf()
    )

    override val title: String get() = "BleHostDemo"
    override fun generate(dependency: ViewDependency): View {
        val xml = BleHostDemoXml()
        val view = xml.setup(dependency)

        val server = Ble.serve(
            viewDependency = dependency,
            characteristics = listOf(characteristic),
            serviceUuids = null,
            advertisingIntensity = 0.5f
        ).until(view.removed)
        server.advertising = true

//        xml.status.bindString(server. { it -> "Serving ${it.size} clients" })
        xml.charValue.bindString(characteristic.map(
            read = { it -> it.toString(Charsets.UTF_8) },
            write = { it -> it.toByteArray(Charsets.UTF_8) }
        ))

        return view
    }
}
