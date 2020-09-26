//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.Unowned
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.ConstantObservableProperty
import com.lightningkite.butterfly.observables.ObservableStack
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindText
import com.lightningkite.butterfly.views.EntryPoint
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterfly.views.onClick
import com.lightningkite.butterflytemplate.layouts.ComponentTestXml
import com.lightningkite.butterflytemplate.layouts.SelectDemoXml

class SelectDemoVG(@Unowned val stack: ObservableStack<ViewGenerator>) : ViewGenerator(), EntryPoint {
    override val title: String get() = "Select Demo"

    val options: List<ViewGenerator> = listOf(
        VideoDemoVG(),
        WebsocketDemoVG(),
        HttpDemoVG(),
        ExternalTestVG(),
//        BleScanDemoVG(stack),
        PongDemoVG(),
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
        stack.push(viewGenerator)
    }

    override fun generate(dependency: ActivityAccess): View {
        val xml = SelectDemoXml()
        val view = xml.setup(dependency)

        xml.list.bind(
            data = ConstantObservableProperty(options),
            defaultValue = options.first(),
            makeView = { obs ->
                val xml = ComponentTestXml()
                val view = xml.setup(dependency)
                xml.label.bindText(obs) { it -> it.title }
                xml.button.onClick { this.selectVG(obs.value) }
                return@bind view
            }
        )

        return view
    }

    override val mainStack: ObservableStack<ViewGenerator>?
        get() = stack
}
