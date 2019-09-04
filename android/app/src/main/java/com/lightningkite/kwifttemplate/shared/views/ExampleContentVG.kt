package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.ExampleContentXml

class ExampleContentVG : ViewGenerator() {
    override val title: String get() = "Example Content"

    val number: StandardObservableProperty<Int> = StandardObservableProperty(0)

    fun increment(){
        number.value += 1
    }

    override fun generate(dependency: ViewDependency): View {
        val xml = ExampleContentXml()
        val view = xml.setup(dependency)
        xml.exampleContentIncrement.onClick(captureWeak(this) { self -> self.increment() })
        xml.exampleContentNumber.bindText(number) { it -> it.toString() }
        return view
    }
}
