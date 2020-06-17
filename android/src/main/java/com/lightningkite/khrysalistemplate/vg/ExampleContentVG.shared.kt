package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.observables.binding.*
import com.lightningkite.khrysalis.observables.*
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.onClick
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.ExampleContentXml

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
        xml.exampleContentIncrement.onClick{ this.increment() }
        xml.exampleContentNumber.bindText(number) { it -> it.toString() }
        xml.chainedIncrement.onClick { this.chained.value.value = this.chained.value.value + 1 }
        xml.chainedNumber.bindString(chained.flatMap { it -> it }.map { it -> it.toString() } )
        xml.scrollToTop.onClick { xml.scrollView.smoothScrollTo(0,0) }
        return view
    }
}
