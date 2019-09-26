package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindString
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.ControlsDemoXml
import com.lightningkite.kwifttemplate.xml.RowTextXml

class ControlsDemoVG() : ViewGenerator() {
    override val title: String get() = "Controls Demo"

    val text: StandardObservableProperty<String> = StandardObservableProperty("")
    val options: StandardObservableProperty<List<String>> =
        StandardObservableProperty(listOf("A", "B", "C", "D"))

    override fun generate(dependency: ViewDependency): View {
        val xml = ControlsDemoXml()
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

        return view
    }
}
