import Foundation
//package com.lightningkite.kwifttemplate.shared.views


//import com.lightningkite.kwift.actuals.SecurePreferences
//import com.lightningkite.kwift.shared.ObservableProperty
//import com.lightningkite.kwift.shared.ViewData
//import com.lightningkite.kwift.shared.ViewDataStack
//import com.lightningkite.kwifttemplate.shared.models.*

final public class ExampleContent2ViewData : ViewData {
    
    public var stack: ViewDataStack
    
    init( stack: ViewDataStack) {
        self.stack = stack
    }
    convenience init(
        _ stack: ViewDataStack
    ){ 
        self.init(
            stack: stack
        ) 
    }
    
    public var title: String {
        get { return "Example Content 2" }
    }
    
}
