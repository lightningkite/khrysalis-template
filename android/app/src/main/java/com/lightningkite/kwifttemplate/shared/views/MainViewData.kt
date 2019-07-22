package com.lightningkite.kwifttemplate.shared.views

import com.lightningkite.kwift.actuals.SecurePreferences
import com.lightningkite.kwift.shared.ViewData
import com.lightningkite.kwift.shared.ViewDataStack
import com.lightningkite.kwifttemplate.shared.models.*

class MainViewData : ViewData {
    override val title: String get() = "Main"

    val stack: ViewDataStack = ViewDataStack()

    init {
        stack.push(ExampleContentViewData(stack))
    }
}
