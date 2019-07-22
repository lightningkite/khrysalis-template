import Foundation
//package com.lightningkite.kwifttemplate.shared.views


//import com.lightningkite.kwift.actuals.SecurePreferences
//import com.lightningkite.kwift.shared.ViewData
//import com.lightningkite.kwift.shared.ViewDataStack
//import com.lightningkite.kwifttemplate.shared.models.*

final public class MainViewData : ViewData {
    
    
    init() {
        self.stack = ViewDataStack() 
        stack.push(ExampleContentViewData(stack))
        
    }
    
    public var title: String {
        get { return "Main" }
    }
    
    
    var stack: ViewDataStack
    
    
}
