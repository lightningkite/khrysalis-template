package com.lightningkite.kwifttemplate.shared.views

import com.lightningkite.kwift.actuals.SecurePreferences
import com.lightningkite.kwift.shared.ObservableProperty
import com.lightningkite.kwift.shared.ViewData
import com.lightningkite.kwift.shared.ViewDataStack
import com.lightningkite.kwifttemplate.shared.models.*

class ExampleContentViewData(val stack: ViewDataStack) : ViewData {
    override val title: String get() = "Example Content"

    val number = ObservableProperty<Int>(0)

    fun increment(){
        number.value += 1
    }

    fun goToAnotherScreen(){
        stack.push(ExampleContent2ViewData(stack))
    }
}
