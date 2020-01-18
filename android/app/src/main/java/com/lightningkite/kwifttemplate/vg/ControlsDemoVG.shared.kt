package com.lightningkite.kwifttemplate.vg

import android.view.View
import com.lightningkite.kwift.observables.binding.bind
import com.lightningkite.kwift.observables.binding.bindString
import com.lightningkite.kwift.observables.StandardObservableProperty
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.ComponentTestXml
import com.lightningkite.kwifttemplate.layouts.ControlsDemoXml

class ControlsDemoVG() : ViewGenerator() {
    override val title: String get() = "Controls Demo"

    val text: StandardObservableProperty<String> = StandardObservableProperty("")
    val options: StandardObservableProperty<List<String>> =
        StandardObservableProperty(listOf("Apple", "Banana", "Chili Pepper", "Dragon Fruit"))

    override fun generate(dependency: ViewDependency): View {
        val xml = ControlsDemoXml()
        val view = xml.setup(dependency)

        xml.editableText.bindString(text)
        xml.editableAutoText.bindString(text)
        xml.editableAutoText.bind(
            options = options,
            toString = { it -> it },
            onItemSelected = { item ->
                this.text.value = item
            }
        )
        xml.editableTextCopy.bindString(text)
        xml.editableTextBig.bindString(text)
        xml.spinner.bind(
            options = options,
            selected = text,
            makeView = { obs ->
                val xml = ComponentTestXml()
                val view = xml.setup(dependency)

                xml.label.bindString(obs)

                return@bind view
            }
        )

        return view
    }
}
