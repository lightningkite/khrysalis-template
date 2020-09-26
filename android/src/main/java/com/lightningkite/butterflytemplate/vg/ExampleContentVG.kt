//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.MutableObservableProperty
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.binding.bindText
import com.lightningkite.butterfly.observables.flatMap
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.onClick
import com.lightningkite.butterflytemplate.layouts.ExampleContentXml

class ExampleContentVG : ViewGenerator() {
    override val title: String get() = "Example Content"

    val number: StandardObservableProperty<Int> = StandardObservableProperty(0)
    val chained: StandardObservableProperty<MutableObservableProperty<Int>> = StandardObservableProperty(StandardObservableProperty(0))

    fun increment(){
        number.value += 1
    }

    override fun generate(dependency: ActivityAccess): View {
        val xml = ExampleContentXml()
        val view = xml.setup(dependency)
        xml.exampleContentIncrement.onClick{ this.increment() }
        xml.exampleContentNumber.bindText(number) { it -> it.toString() }
        xml.chainedIncrement.onClick { this.chained.value.value = this.chained.value.value + 1 }
        xml.chainedNumber.bindString(chained.flatMap { it -> it }.map { it -> it.toString() } )
        xml.scrollToTop.onClick { xml.scrollView.smoothScrollTo(0,0) }
        return view
    }
}
