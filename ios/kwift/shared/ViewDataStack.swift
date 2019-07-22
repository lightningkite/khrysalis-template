import Foundation
//package com.lightningkite.kwift.shared


final public class ViewDataStack {
    
    
    
    init() {
    }
    
    var stack = [ViewData]()
    var changeEvent = Event<[ViewData]>()
    
    func push(viewData: ViewData) {
        stack.add(viewData)
        changeEvent.invokeAll(value : stack)
    }
    func push(_ viewData: ViewData) { push(viewData: viewData) }
    
    func pop() -> Bool {
        if stack.size <= 1 {
            return false
        }
        stack.removeAt(stack.lastIndex)
        changeEvent.invokeAll(value : stack)
        return true
    }
    
    func popTo(viewData: ViewData) {
        var found = false
        for i in 0...stack.lastIndex {
            if found{
                stack.removeAt(stack.lastIndex)
            } else if stack[i] === viewData{
                found = true
            }
        }
        changeEvent.invokeAll(value : stack)
    }
    func popTo(_ viewData: ViewData) { popTo(viewData: viewData) }
    
    func root() {
        popTo(viewData : stack.first())
    }
    
    func reset(viewData: ViewData) {
        stack.clear()
        stack.add(viewData)
        changeEvent.invokeAll(value : stack)
    }
    func reset(_ viewData: ViewData) { reset(viewData: viewData) }
}
