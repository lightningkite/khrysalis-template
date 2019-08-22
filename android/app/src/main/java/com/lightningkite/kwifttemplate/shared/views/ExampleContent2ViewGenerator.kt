package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.ExampleContent2Xml

class ExampleContent2ViewGenerator(val stack: ObservableStack<ViewGenerator>) : ViewGenerator() {
    override val title: String get() = "Example Content 2 "

    override fun generate(dependency: ViewDependency): View {
        val xml = ExampleContent2Xml()
        val view = xml.setup(dependency)
        return view
    }
}
