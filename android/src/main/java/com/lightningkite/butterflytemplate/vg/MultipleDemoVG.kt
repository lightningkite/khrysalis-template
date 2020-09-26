//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.ConstantObservableProperty
import com.lightningkite.butterfly.observables.binding.bindMulti
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.ComponentTestXml
import com.lightningkite.butterflytemplate.layouts.ComponentTextXml
import com.lightningkite.butterflytemplate.layouts.MultipleDemoXml

class MultipleDemoVG() : ViewGenerator() {
    override val title: String get() = "Multiple List Demo"

    val data: List<Any> = listOf(
        1.toInt(),
        2.toInt(),
        "3",
        4.toInt(),
        "5",
        Unit,
        "Test",
        6.toInt()
    ) as List<Any>

    override fun generate(dependency: ActivityAccess): View {
        val xml = MultipleDemoXml()
        val view = xml.setup(dependency)

        xml.list.bindMulti(
            viewDependency = dependency,
            data = ConstantObservableProperty(data),
            typeHandlerSetup = { handler ->
                handler.handle(0.toInt()) { obs ->
                    val cellXml = ComponentTestXml()
                    val cellView = cellXml.setup(dependency)
                    cellXml.label.bindString(obs.map { it ->"The number $it" })
                    return@handle cellView
                }
                handler.handle("") { obs ->
                    val cellXml = ComponentTestXml()
                    val cellView = cellXml.setup(dependency)
                    cellXml.label.bindString(obs.map { it ->"The string '$it'" })
                    return@handle cellView
                }
                handler.handle(Unit) { obs ->
                    val cellXml = ComponentTextXml()
                    val cellView = cellXml.setup(dependency)
                    cellXml.label.text = "-----"
                    return@handle cellView
                }
            }
        )

        return view
    }
}
