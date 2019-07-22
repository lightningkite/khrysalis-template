package com.lightningkite.kwifttemplate.android.views

import android.content.Context
import com.lightningkite.kwift.android.*
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwifttemplate.shared.views.ExampleContent2ViewData
import com.lightningkite.kwifttemplate.shared.views.ExampleContentViewData
import com.lightningkite.kwifttemplate.shared.views.MainViewData
import kotlinx.android.synthetic.main.example_content.view.*

class ExampleContent2View(context: Context, data: ExampleContent2ViewData) : ViewDataView<ExampleContent2ViewData>(context, data) {
    init {
        layout(R.layout.example_content2)
    }
}
