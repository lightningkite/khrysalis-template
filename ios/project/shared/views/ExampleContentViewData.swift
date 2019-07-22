import Foundation
//package com.lightningkite.kwifttemplate.shared.views


//import com.lightningkite.kwift.actuals.SecurePreferences
//import com.lightningkite.kwift.shared.ObservableProperty
//import com.lightningkite.kwift.shared.ViewData
//import com.lightningkite.kwift.shared.ViewDataStack
//import com.lightningkite.kwifttemplate.shared.models.*

final public class ExampleContentViewData : ViewData {
    
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
        get { return "Example Content" }
    }
    
    
    var number = ObservableProperty<Int>(0)
    
    func increment(){
        number.value += 1
    }
    
    func goToAnotherScreen(){
        stack.push(ExampleContent2ViewData(stack))
    }
}
