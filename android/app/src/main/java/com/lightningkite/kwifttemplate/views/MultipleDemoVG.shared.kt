package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.weak
import com.lightningkite.kwift.observables.binding.bind
import com.lightningkite.kwift.observables.binding.bindMulti
import com.lightningkite.kwift.observables.binding.bindString
import com.lightningkite.kwift.observables.binding.bindText
import com.lightningkite.kwift.observables.ConstantObservableProperty
import com.lightningkite.kwift.observables.ObservableStack
import com.lightningkite.kwift.observables.map
import com.lightningkite.kwift.captureWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.onClick
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.MultipleDemoXml
import com.lightningkite.kwifttemplate.layouts.RowTestXml
import com.lightningkite.kwifttemplate.layouts.RowTextXml
import com.lightningkite.kwifttemplate.layouts.SelectDemoXml

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

    override fun generate(dependency: ViewDependency): View {
        val xml = MultipleDemoXml()
        val view = xml.setup(dependency)

        xml.list.bindMulti(
            viewDependency = dependency,
            data = ConstantObservableProperty(data),
            typeHandlerSetup = { handler ->
                handler.handle(0.toInt()) { obs ->
                    val cellXml = RowTestXml()
                    val cellView = cellXml.setup(dependency)
                    cellXml.label.bindString(obs.map { it ->"The number $it" })
                    return@handle cellView
                }
                handler.handle("") { obs ->
                    val cellXml = RowTestXml()
                    val cellView = cellXml.setup(dependency)
                    cellXml.label.bindString(obs.map { it ->"The string '$it'" })
                    return@handle cellView
                }
                handler.handle(Unit) { obs ->
                    val cellXml = RowTextXml()
                    val cellView = cellXml.setup(dependency)
                    cellXml.label.text = "-----"
                    return@handle cellView
                }
            }
        )

        return view
    }
}
