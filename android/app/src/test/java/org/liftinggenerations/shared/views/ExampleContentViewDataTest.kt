package org.liftinggenerations.shared.views

import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.shared.views.ExampleContent2ViewGenerator
import com.lightningkite.kwifttemplate.shared.views.ExampleContentViewGenerator
import org.junit.Test

class ExampleContentViewDataTest {

    @Test
    fun canCreate() {
        val stack = ObservableStack<ViewGenerator>()
        stack.push(ExampleContentViewGenerator(stack))
    }

    @Test
    fun incrementWorksAtZero() {
        val stack = ObservableStack<ViewGenerator>()
        val data = ExampleContentViewGenerator(stack)
        stack.push(data)

        data.number.value = 0
        data.increment()
        assert(data.number.value == 1)
    }

    @Test
    fun incrementWorksAtOne() {
        val stack = ObservableStack<ViewGenerator>()
        val data = ExampleContentViewGenerator(stack)
        stack.push(data)

        data.number.value = 1
        data.increment()
        assert(data.number.value == 2)
    }

    @Test
    fun navigationToAnotherScreenWorks() {
        val stack = ObservableStack<ViewGenerator>()
        val data = ExampleContentViewGenerator(stack)
        stack.push(data)

        data.goToAnotherScreen()
        assert(stack.stack.last() is ExampleContent2ViewGenerator)
    }

}
