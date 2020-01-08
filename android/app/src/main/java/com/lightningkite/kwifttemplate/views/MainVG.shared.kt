package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.observables.binding.*
import com.lightningkite.kwift.observables.ObservableProperty
import com.lightningkite.kwift.observables.ObservableStack
import com.lightningkite.kwift.observables.transformed
import com.lightningkite.kwift.captureWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.onClick
import com.lightningkite.kwift.views.EntryPoint
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.MainXml

class MainVG : ViewGenerator(), EntryPoint {
    override val title: String get() = "Main"


    //invalidatee
    val stack: ObservableStack<ViewGenerator> = ObservableStack<ViewGenerator>()
    override val mainStack: ObservableStack<ViewGenerator>?
        get() = stack
    val shouldBackBeShown: ObservableProperty<Boolean> = stack.transformed { it -> it.size > 1 }

    init {
        stack.push(SelectDemoVG(stack))
    }

    override fun generate(dependency: ViewDependency): View {
        val xml = MainXml()
        val view = xml.setup(dependency)

        xml.mainContent.bindStack(dependency, stack)
        xml.title.bindString(stack.transformed { it -> it.lastOrNull()?.title ?: "" })
        xml.mainBack.bindVisible(shouldBackBeShown)
        xml.mainBack.onClick(captureWeak(this) { self -> self.stack.pop(); Unit })

        return view
    }

    override fun handleDeepLink(schema: String, host: String, path: String, params: Map<String, String>) {
        stack.push(ExampleContentVG())
    }

}
