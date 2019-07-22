package com.lightningkite.kwifttemplate.shared.views

import com.lightningkite.kwift.actuals.SecurePreferences
import com.lightningkite.kwift.shared.ObservableProperty
import com.lightningkite.kwift.shared.ViewData
import com.lightningkite.kwift.shared.ViewDataStack
import com.lightningkite.kwifttemplate.shared.models.*

class ExampleContent2ViewData(val stack: ViewDataStack) : ViewData {
    override val title: String get() = "Example Content 2"
}
