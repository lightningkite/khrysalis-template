package com.lightningkite.kwift.shared

import com.lightningkite.kwift.actuals.StringReference
import com.lightningkite.kwift.actuals.escaping
import com.lightningkite.kwift.shared.Event
import com.lightningkite.kwift.shared.ObservableProperty

val lastDialog = ObservableProperty<DialogRequest?>(null)
val showDialogEvent = Event<DialogRequest>()

class DialogRequest(
    val string: String? = null,
    val stringReference: StringReference? = null,
    val confirmation: (()->Unit)? = null
)

fun showDialog(request: DialogRequest) {
    lastDialog.value = request
    showDialogEvent.invokeAll(request)
}

fun showDialog(message: String) {
    showDialog(DialogRequest(string = message))
}

fun showDialogByReference(message: StringReference) {
    showDialog(DialogRequest(stringReference = message))
}
