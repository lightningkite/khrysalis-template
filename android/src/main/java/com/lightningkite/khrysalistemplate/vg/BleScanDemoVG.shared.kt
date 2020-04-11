package com.lightningkite.khrysalistemplate.vg

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.*
import com.lightningkite.khrysalis.bluetooth.Ble
import com.lightningkite.khrysalis.bluetooth.BleDeviceInfo
import com.lightningkite.khrysalis.bluetooth.BleScanResult
import com.lightningkite.khrysalis.lifecycle.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalis.observables.*
import com.lightningkite.khrysalis.observables.binding.*
import com.lightningkite.khrysalis.rx.removed
import com.lightningkite.khrysalis.rx.until
import com.lightningkite.khrysalistemplate.R
import com.lightningkite.khrysalistemplate.layouts.*
import io.reactivex.rxkotlin.subscribeBy

@Suppress("NAME_SHADOWING")
class BleScanDemoVG(
    val stack: ObservableStack<ViewGenerator>
) : ViewGenerator() {

    override val title: String get() = "BleScanDemo"

    val devices: MutableObservableProperty<Map<String, BleScanResult>> = StandardObservableProperty(mapOf())

    override fun generate(dependency: ViewDependency): View {
        val xml = BleScanDemoXml()
        val view = xml.setup(dependency)

        xml.button.onClick(captureWeak(xml.button){ button ->
            Ble.scan(viewDependency = dependency)
                .subscribeBy { result ->
                    this.devices.value = this.devices.value + Pair(result.info.id, result)
                }
                .until(button.removed)
        })

        xml.host.onClick {
            this.stack.push(BleHostDemoVG())
        }

        xml.items.bind(
            data = devices.map { it -> it.values.sortedByDescending { it -> it.rssi } },
            defaultValue = BleScanResult(BleDeviceInfo("", ""), -1000),
            makeView = label@ { obs ->
                val cellXml = ComponentBleDeviceXml()
                val cellView = cellXml.setup(dependency)
                cellXml.deviceName.bindString(obs.map { it -> it.info.name ?: "No Name"})
                cellXml.deviceId.bindString(obs.map { it -> it.info.id })
                cellXml.rssi.bindString(obs.map { it -> it.rssi.toString() })
                cellXml.connect.onClick {  }
                return@label cellView
            }
        )

        return view
    }

}
