package org.liftinggenerations.shared.views

import com.lightningkite.butterflytemplate.shared.views.ExampleContentVG
import org.junit.Test

class ExampleContentViewDataTest {

    @Test
    fun canCreate() {
        ExampleContentVG()
    }

    @Test
    fun incrementWorksAtZero() {
        val data = ExampleContentVG()

        data.number.value = 0
        data.increment()
        assert(data.number.value == 1)
    }

    @Test
    fun incrementWorksAtOne() {
        val data = ExampleContentVG()

        data.number.value = 1
        data.increment()
        assert(data.number.value == 2)
    }
}
