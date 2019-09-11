//Package: com.lightningkite.kwift.views.shared
//Converted using Kwift2

import Foundation


public var lastDialog = StandardObservableProperty<DialogRequest?>(nil)
public var showDialogEvent = StandardEvent<DialogRequest>()

public class DialogRequest {
    
    public var string: String? 
    public var stringReference: StringResource? 
    public var confirmation: (() -> Void)? 
    
    
    public init(string: String?  = nil, stringReference: StringResource?  = nil, confirmation: (() -> Void)?  = nil) {
        self.string = string
        self.stringReference = stringReference
        self.confirmation = confirmation
    }
    convenience public init(_ string: String?  = nil, _ stringReference: StringResource?  = nil, _ confirmation: (() -> Void)?  = nil) {
        self.init(string: string, stringReference: stringReference, confirmation: confirmation)
    }
}
 
 

public func showDialog(request: DialogRequest) -> Void {
    lastDialog .value = request
    showDialogEvent.invokeAll(request)
}
public func showDialog(_ request: DialogRequest) -> Void {
    return showDialog(request: request)
}
 
 

public func showDialog(message: String) -> Void {
    showDialog(DialogRequest(string: message))
}
public func showDialog(_ message: String) -> Void {
    return showDialog(message: message)
}
 
 

public func showDialogByReference(message: StringResource) -> Void {
    showDialog(DialogRequest(stringReference: message))
}
public func showDialogByReference(_ message: StringResource) -> Void {
    return showDialogByReference(message: message)
}
 
