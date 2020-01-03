package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.actual.weak
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.shared.ConstantObservableProperty
import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.EntryPoint
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.RowTestXml
import com.lightningkite.kwifttemplate.layouts.SelectDemoXml

class SelectDemoVG(stack: ObservableStack<ViewGenerator>) : ViewGenerator(), EntryPoint {
    val stack: ObservableStack<ViewGenerator>? by weak(stack)
    override val title: String get() = "Select Demo"

    val options: List<ViewGenerator> = listOf(
        PongDemoVG(),
        FloatingHexagonsDemoVG(),
        MarginTestsVG(),
        MultipleDemoVG(),
        DateButtonDemoVG(),
        MapDemoVG(),
        LocationDemoVG(),
        LoadImageDemoVG(),
        ControlsDemoVG(),
        ExampleContentVG(),
        ViewPagerDemoVG(stack),
        SegmentedControlDemoVG(),
        SliderDemoVG(),
        WeekDemoVG(),
        DateRangeDemoVG(),
        LoginDemoVG(stack),
        DrawableDemoVG(),
        PreviewVG()
    )

    fun selectVG(viewGenerator: ViewGenerator){
        stack?.push(viewGenerator)
    }

    override fun generate(dependency: ViewDependency): View {
        val xml = SelectDemoXml()
        val view = xml.setup(dependency)

        xml.list.bind(
            data = ConstantObservableProperty(options),
            defaultValue = options.first(),
            makeView = { obs ->
                val xml = RowTestXml()
                val view = xml.setup(dependency)
                xml.label.bindText(obs) { it -> it.title }
                xml.button.onClick(captureWeak(this){ self -> self.selectVG(obs.value) })
                return@bind view
            }
        )

        return view
    }

    override val mainStack: ObservableStack<ViewGenerator>?
        get() = stack
}
