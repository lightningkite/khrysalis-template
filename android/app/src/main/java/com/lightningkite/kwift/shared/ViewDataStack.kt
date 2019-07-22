package com.lightningkite.kwift.shared

class ViewDataStack {

    val stack = ArrayList<ViewData>()
    val changeEvent = Event<List<ViewData>>()

    fun push(viewData: ViewData) {
        stack.add(viewData)
        changeEvent.invokeAll(value = stack)
    }

    fun pop(): Boolean {
        if (stack.size <= 1) {
            return false
        }
        stack.removeAt(stack.lastIndex)
        changeEvent.invokeAll(value = stack)
        return true
    }

    fun popTo(viewData: ViewData) {
        var found = false
        for (i in 0..stack.lastIndex) {
            if(found){
                stack.removeAt(stack.lastIndex)
            } else if (stack[i] === viewData){
                found = true
            }
        }
        changeEvent.invokeAll(value = stack)
    }

    fun root() {
        popTo(viewData = stack.first())
    }

    fun reset(viewData: ViewData) {
        stack.clear()
        stack.add(viewData)
        changeEvent.invokeAll(value = stack)
    }
}
