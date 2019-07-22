package com.lightningkite.kwifttemplate.android.views

import android.content.Context
import com.lightningkite.kwift.android.*
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwifttemplate.shared.views.ExampleContentViewData
import com.lightningkite.kwifttemplate.shared.views.MainViewData
import kotlinx.android.synthetic.main.example_content.view.*

class ExampleContentView(context: Context, data: ExampleContentViewData) : ViewDataView<ExampleContentViewData>(context, data) {
    init {
        layout(R.layout.example_content)
        exampleContentIncrement.setOnClickListener { data.increment() }
        exampleContentNumber.bindText(data.number){ it.toString() }
        exampleContentGoToAnotherScreen.setOnClickListener { data.goToAnotherScreen() }
    }
}
