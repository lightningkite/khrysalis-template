package com.lightningkite.kwift.views.shared

import com.lightningkite.kwift.actuals.StringReference
import com.lightningkite.kwift.observables.shared.StandardEvent
import com.lightningkite.kwift.observables.shared.StandardObservableProperty

val lastDialog = StandardObservableProperty<DialogRequest?>(null)
val showDialogEvent = StandardEvent<DialogRequest>()

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
