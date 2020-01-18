package com.lightningkite.kwifttemplate.vg

import android.view.View
import com.lightningkite.kwift.observables.binding.*
import com.lightningkite.kwift.observables.*
import com.lightningkite.kwift.captureWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.onClick
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.ExampleContentXml

class ExampleContentVG : ViewGenerator() {
    override val title: String get() = "Example Content"

    val number: StandardObservableProperty<Int> = StandardObservableProperty(0)
    val chained: StandardObservableProperty<MutableObservableProperty<Int>> = StandardObservableProperty(StandardObservableProperty(0))

    fun increment(){
        number.value += 1
    }

    override fun generate(dependency: ViewDependency): View {
        val xml = ExampleContentXml()
        val view = xml.setup(dependency)
        xml.exampleContentIncrement.onClick(captureWeak(this) { self -> self.increment() })
        xml.exampleContentNumber.bindText(number) { it -> it.toString() }
        xml.chainedIncrement.onClick { this.chained.value.value = this.chained.value.value + 1 }
        xml.chainedNumber.bindString(chained.flatMap { it -> it }.map { it -> it.toString() } )
        return view
    }
}
