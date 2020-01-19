package com.lightningkite.kwifttemplate.vg

import android.widget.*
import android.view.*
import com.lightningkite.kwift.*
import com.lightningkite.kwift.bluetooth.Ble
import com.lightningkite.kwift.bluetooth.BleDeviceInfo
import com.lightningkite.kwift.lifecycle.*
import com.lightningkite.kwift.views.*
import com.lightningkite.kwift.observables.*
import com.lightningkite.kwift.observables.binding.*
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwifttemplate.layouts.*

@Suppress("NAME_SHADOWING")
class BleScanDemoVG(
    val stack: ObservableStack<ViewGenerator>
) : ViewGenerator() {

    override val title: String get() = "BleScanDemo"

    val devices: MutableObservableProperty<Map<String, BleDeviceInfo>> = StandardObservableProperty(mapOf())

    override fun generate(dependency: ViewDependency): View {
        val xml = BleScanDemoXml()
        val view = xml.setup(dependency)

        xml.button.onClick(captureWeak(xml.button){ button ->
            val closeable = Ble.scan(
                viewDependency = dependency,
                withServices = listOf(),
                intensity = .5f,
                onDeviceFound = { device ->
                    println("Found device $device")
                    this.devices.value = this.devices.value + Pair(device.id, device)
                }
            )
            (button.lifecycle and appInForeground).closeWhenOff(closeable)
        })

        xml.host.onClick {
            this.stack.push(BleHostDemoVG())
        }

        xml.items.bind(
            data = devices.map { it -> it.values.sortedByDescending { it -> it.rssi } },
            defaultValue = BleDeviceInfo("", "", 0),
            makeView = label@ { obs ->
                val cellXml = ComponentBleDeviceXml()
                val cellView = cellXml.setup(dependency)
                cellXml.deviceName.bindString(obs.map { it -> it.name })
                cellXml.deviceId.bindString(obs.map { it -> it.id })
                cellXml.rssi.bindString(obs.map { it -> it.rssi.toString() })
                cellXml.connect.onClick {  }
                return@label cellView
            }
        )

        return view
    }

}
