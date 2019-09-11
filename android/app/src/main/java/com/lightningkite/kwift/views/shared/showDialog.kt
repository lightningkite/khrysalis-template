package com.lightningkite.kwift.views.shared

import com.lightningkite.kwift.observables.shared.StandardEvent
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.views.actual.StringResource

val lastDialog = StandardObservableProperty<DialogRequest?>(null)
val showDialogEvent = StandardEvent<DialogRequest>()

class DialogRequest(
    val string: String? = null,
    val stringReference: StringResource? = null,
    val confirmation: (()->Unit)? = null
)

fun showDialog(request: DialogRequest) {
    lastDialog.value = request
    showDialogEvent.invokeAll(request)
}

fun showDialog(message: String) {
    showDialog(DialogRequest(string = message))
}

fun showDialogByReference(message: StringResource) {
    showDialog(DialogRequest(stringReference = message))
}
