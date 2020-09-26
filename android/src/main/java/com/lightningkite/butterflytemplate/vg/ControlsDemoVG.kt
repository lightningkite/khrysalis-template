//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindInteger
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.ControlsDemoXml

class ControlsDemoVG() : ViewGenerator() {
    override val title: String get() = "Controls Demo"

    val text: StandardObservableProperty<String> = StandardObservableProperty("")
    val options: StandardObservableProperty<List<String>> =
        StandardObservableProperty(listOf("Apple", "Banana", "Chili Pepper", "Dragon Fruit"))
    val number: StandardObservableProperty<Int> = StandardObservableProperty(32)

    override fun generate(dependency: ActivityAccess): View {
        val xml = ControlsDemoXml()
        val view = xml.setup(dependency)

        xml.numberText.bindInteger(number)
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
            selected = text
        )

        return view
    }
}
