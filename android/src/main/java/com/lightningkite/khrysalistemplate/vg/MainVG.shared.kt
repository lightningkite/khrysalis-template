package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.observables.binding.*
import com.lightningkite.khrysalis.observables.ObservableProperty
import com.lightningkite.khrysalis.observables.ObservableStack
import com.lightningkite.khrysalis.observables.transformed
import com.lightningkite.khrysalis.captureWeak
import com.lightningkite.khrysalis.observables.map
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.onClick
import com.lightningkite.khrysalis.views.EntryPoint
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.MainXml

class MainVG : ViewGenerator(), EntryPoint {
    override val title: String get() = "Main"


    //invalidatee
    val stack: ObservableStack<ViewGenerator> = ObservableStack<ViewGenerator>()
    override val mainStack: ObservableStack<ViewGenerator>?
        get() = stack
    val shouldBackBeShown: ObservableProperty<Boolean> = stack.map { it -> it.size > 1 }

    init {
        stack.push(SelectDemoVG(stack))
    }

    override fun generate(dependency: ViewDependency): View {
        val xml = MainXml()
        val view = xml.setup(dependency)

        xml.mainContent.bindStack(dependency, stack)
        xml.title.bindString(stack.map { it -> it.lastOrNull()?.title ?: "" })
        xml.mainBack.bindVisible(shouldBackBeShown)
        xml.mainBack.onClick(captureWeak(this) { self -> self.stack.pop(); Unit })

        return view
    }

    override fun handleDeepLink(schema: String, host: String, path: String, params: Map<String, String>) {
        stack.push(ExampleContentVG())
    }

}