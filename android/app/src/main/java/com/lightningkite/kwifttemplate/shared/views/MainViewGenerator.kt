package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bindStack
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.actual.bindVisible
import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.observables.shared.transformed
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.MainXml

class MainViewGenerator : ViewGenerator() {
    override val title: String get() = "Main"

    val stack: ObservableStack<ViewGenerator> = ObservableStack<ViewGenerator>()

    init {
        stack.push(ExampleContentViewData(stack))
    }

    override fun generate(dependency: ViewDependency): View {
        val xml = MainXml()
        val view = xml.setup(dependency)

        xml.boundViewMainContent.bindStack(dependency, stack)
        xml.boundViewTitle.bindText(stack) { it -> it.lastOrNull()?.title ?: "" }
        xml.boundViewMainBack.bindVisible(stack.transformed { it -> it.size > 1 })
        xml.boundViewMainBack.onClick(captureWeak(this) { self -> self.stack.pop(); Unit })

        return view
    }
}
