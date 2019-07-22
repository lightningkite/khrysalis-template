package com.lightningkite.kwifttemplate.android.views

import android.content.Context
import android.view.View
import com.lightningkite.kwift.android.*
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwifttemplate.shared.views.MainViewData
import kotlinx.android.synthetic.main.main.view.*

class MainView(context: Context, data: MainViewData) : ViewDataView<MainViewData>(context, data) {

    init {
        layout(R.layout.main)

        mainContent.bindStack(data.stack)
        mainBack.bindBackButton(data.stack)

        lifecycle.listen(onBackPressed) {
            data.stack.pop()
        }
    }
}
