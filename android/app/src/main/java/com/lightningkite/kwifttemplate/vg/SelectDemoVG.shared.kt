package com.lightningkite.kwifttemplate.vg

import android.view.View
import com.lightningkite.kwift.weak
import com.lightningkite.kwift.observables.binding.bind
import com.lightningkite.kwift.observables.binding.bindText
import com.lightningkite.kwift.observables.ConstantObservableProperty
import com.lightningkite.kwift.observables.ObservableStack
import com.lightningkite.kwift.captureWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.onClick
import com.lightningkite.kwift.views.EntryPoint
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.ComponentTestXml
import com.lightningkite.kwifttemplate.layouts.SelectDemoXml

class SelectDemoVG(stack: ObservableStack<ViewGenerator>) : ViewGenerator(), EntryPoint {
    val stack: ObservableStack<ViewGenerator>? by weak(stack)
    override val title: String get() = "Select Demo"

    val options: List<ViewGenerator> = listOf(
        BleScanDemoVG(stack),
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
                val xml = ComponentTestXml()
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
