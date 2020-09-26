//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.ObservableProperty
import com.lightningkite.butterfly.observables.ObservableStack
import com.lightningkite.butterfly.observables.binding.bindStack
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.binding.bindVisible
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.views.EntryPoint
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.onClick
import com.lightningkite.butterflytemplate.layouts.MainXml

class MainVG : ViewGenerator(), EntryPoint {
    override val title: String get() = "Main"

    val stack: ObservableStack<ViewGenerator> = ObservableStack<ViewGenerator>()
    override val mainStack: ObservableStack<ViewGenerator>?
        get() = stack
    val shouldBackBeShown: ObservableProperty<Boolean> = stack.map { it -> it.size > 1 }

    init {
        stack.push(SelectDemoVG(stack))
    }

    override fun generate(dependency: ActivityAccess): View {
        val xml = MainXml()
        val view = xml.setup(dependency)

        xml.mainContent.bindStack(dependency, stack)
        xml.title.bindString(stack.map { it -> it.lastOrNull()?.title ?: "" })
        xml.mainBack.bindVisible(shouldBackBeShown)
        xml.mainBack.onClick { this.stack.pop() }

        return view
    }

    override fun handleDeepLink(schema: String, host: String, path: String, params: Map<String, String>) {
        stack.push(ExampleContentVG())
    }

}
