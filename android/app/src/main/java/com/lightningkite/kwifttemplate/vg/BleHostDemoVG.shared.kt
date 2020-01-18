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
class BleHostDemoVG(
) : ViewGenerator() {

    val characteristic = PropertyBleCharacteristicServer(
        serviceUuid = UUID.fromString("7eab90f5-7c6e-4152-ab3e-9d4ebe39ac1c"),
        uuid = UUID.fromString("7b476b68-50fa-4d13-b2fc-e54f8a299212"),
        value = byteArrayOf()
    )

    override val title: String get() = "BleHostDemo"
    override fun generate(dependency: ViewDependency): View {
        val xml = BleHostDemoXml()
        val view = xml.setup(dependency)

        val server = Ble.serve(
            viewDependency = dependency,
            characteristics = listOf(characteristic)
        )
        (appInForeground and view.lifecycle).closeWhenOff(server)

        xml.status.bindString(server.clients.map { it -> "Serving ${it.size} clients" })
        xml.charValue.bindString(characteristic.map(
            read = { it -> it.toString(Charsets.UTF_8) },
            write = { it -> it.toByteArray(Charsets.UTF_8) }
        ))

        return view
    }
}
