package org.liftinggenerations.shared.views

import com.lightningkite.kwift.shared.ViewDataStack
import com.lightningkite.kwifttemplate.shared.views.ExampleContent2ViewData
import com.lightningkite.kwifttemplate.shared.views.ExampleContentViewData
import org.junit.Test

class ExampleContentViewDataTest {

    @Test
    fun canCreate() {
        val stack = ViewDataStack()
        stack.push(ExampleContentViewData(stack))
    }

    @Test
    fun incrementWorksAtZero() {
        val stack = ViewDataStack()
        val data = ExampleContentViewData(stack)
        stack.push(data)

        data.number.value = 0
        data.increment()
        assert(data.number.value == 1)
    }

    @Test
    fun incrementWorksAtOne() {
        val stack = ViewDataStack()
        val data = ExampleContentViewData(stack)
        stack.push(data)

        data.number.value = 1
        data.increment()
        assert(data.number.value == 2)
    }

    @Test
    fun navigationToAnotherScreenWorks() {
        val stack = ViewDataStack()
        val data = ExampleContentViewData(stack)
        stack.push(data)

        data.goToAnotherScreen()
        assert(stack.stack.last() is ExampleContent2ViewData)
    }

}
