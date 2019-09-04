package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.actuals.weak
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindString
import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.RowTestXml
import com.lightningkite.kwifttemplate.xml.RowTextXml
import com.lightningkite.kwifttemplate.xml.SwitchManiaXml

class SwitchManiaVG(stack: ObservableStack<ViewGenerator>) : ViewGenerator() {
    val stack: ObservableStack<ViewGenerator>? by weak(stack)
    override val title: String get() = "Switch Mania!"

    val text: StandardObservableProperty<String> = StandardObservableProperty("")
    val options: StandardObservableProperty<List<String>> =
        StandardObservableProperty(listOf("A", "B", "C", "D"))

    override fun generate(dependency: ViewDependency): View {
        val xml = SwitchManiaXml()
        val view = xml.setup(dependency)

        xml.editableText.bindString(text)
        xml.editableTextCopy.bindString(text)
        xml.spinner.bind(
            options = options,
            selected = text,
            makeView = { obs ->
                val xml = RowTextXml()
                val view = xml.setup(dependency)

                xml.label.bindString(obs)

                return@bind view
            }
        )
        xml.recyclerView.bind(
            data = options,
            defaultValue = "Default",
            makeView = { obs ->
                val xml = RowTestXml()
                val view = xml.setup(dependency)

                xml.label.bindString(obs)
                xml.button.onClick(captureWeak(this) { self ->
                    self.text.value = obs.value
                })

                return@bind view
            }
        )

        return view
    }
}
