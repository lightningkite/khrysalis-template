package com.lightningkite.kwifttemplate

import android.app.AlertDialog
import android.os.Bundle
import com.lightningkite.kwift.android.AccessibleActivity
import com.lightningkite.kwift.observables.shared.addWeak
import com.lightningkite.kwift.views.shared.showDialogEvent
import com.lightningkite.kwifttemplate.shared.views.MainVG


class MainActivity : AccessibleActivity() {

    companion object {
        val viewData: MainVG by lazy { MainVG() }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val view = viewData.generate(this)

        showDialogEvent.addWeak(view) { view, request ->
            val builder = AlertDialog.Builder(this)
            builder.setMessage(request.string.get(this))
            request.confirmation?.let { conf ->
                builder.setPositiveButton(R.string.ok) { dialog, which -> conf.invoke(); dialog.dismiss() }
                builder.setNeutralButton(R.string.cancel) { dialog, which -> dialog.dismiss() }
            } ?: run {
                builder.setPositiveButton(R.string.ok) { dialog, which -> dialog.dismiss() }
            }
            builder
                .create()
                .show()
        }

        setContentView(view)
    }

    override fun onBackPressed() {
        if (!viewData.stack.pop()) super.onBackPressed()
    }
}
