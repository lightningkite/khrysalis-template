import Foundation
//package com.lightningkite.kwift.shared


//import com.lightningkite.kwift.actuals.StringReference
//import com.lightningkite.kwift.actuals.escaping
//import com.lightningkite.kwift.shared.Event
//import com.lightningkite.kwift.shared.ObservableProperty

var lastDialog = ObservableProperty<DialogRequest?>(nil)
var showDialogEvent = Event<DialogRequest>()

final public class DialogRequest{
    public var string: String? 
    public var stringReference: StringReference? 
    public var confirmation: (()->Void)? 
    
    init( string: String? = nil, stringReference: StringReference? = nil, confirmation: (()->Void)? = nil ) {
        self.string = string
        self.stringReference = stringReference
        self.confirmation = confirmation
    }
    convenience init(
        _ string: String? ,
        _ stringReference: StringReference? = nil,
        _ confirmation: (()->Void)? = nil
    ){ 
        self.init(
            string: string,
            stringReference: stringReference,
            confirmation: confirmation
        ) 
    }
}

func showDialog(request: DialogRequest) {
    lastDialog.value = request
    showDialogEvent.invokeAll(request)
}
func showDialog(_ request: DialogRequest) { showDialog(request: request) }

func showDialog(message: String) {
    showDialog(DialogRequest(string : message))
}
func showDialog(_ message: String) { showDialog(message: message) }

func showDialogByReference(message: StringReference) {
    showDialog(DialogRequest(stringReference : message))
}
func showDialogByReference(_ message: StringReference) { showDialogByReference(message: message) }
