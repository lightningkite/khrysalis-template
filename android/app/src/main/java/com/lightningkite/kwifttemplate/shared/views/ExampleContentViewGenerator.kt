package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.ExampleContentXml

class ExampleContentViewGenerator(val stack: ObservableStack<ViewGenerator>) : ViewGenerator() {
    override val title: String get() = "Example Content"

    val number: StandardObservableProperty<Int> = StandardObservableProperty(0)

    fun increment(){
        number.value += 1
    }

    fun goToAnotherScreen(){
        stack.push(SwitchManiaVG(stack))
    }

    override fun generate(dependency: ViewDependency): View {
        val xml = ExampleContentXml()
        val view = xml.setup(dependency)
        xml.exampleContentIncrement.onClick(captureWeak(this) { self -> self.increment() })
        xml.exampleContentGoToAnotherScreen.onClick(captureWeak(this) { self -> self.goToAnotherScreen() })
        xml.exampleContentNumber.bindText(number) { it -> it.toString() }
        return view
    }
}
