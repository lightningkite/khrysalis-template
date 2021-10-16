//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.jakewharton.rxbinding4.view.clicks
import com.lightningkite.khrysalis.Unowned
import com.lightningkite.rx.viewgenerators.ActivityAccess
import io.reactivex.rxjava3.core.Observable
import com.lightningkite.rx.viewgenerators.StackSubject
import com.lightningkite.rx.ValueSubject
import com.lightningkite.rx.android.*
import com.lightningkite.rx.viewgenerators.EntryPoint
import com.lightningkite.rx.viewgenerators.*
import com.lightningkite.rx.android.resources.*
import com.lightningkite.rx.android.onClick
import com.lightningkite.butterflytemplate.databinding.ComponentTestBinding
import com.lightningkite.butterflytemplate.databinding.SelectDemoBinding

class SelectDemoVG(@Unowned val stack: StackSubject<ViewGenerator>) : ViewGenerator {
    override val titleString: ViewString get() = ViewStringRaw("Select Demo")

    val options: List<ViewGenerator> = listOf(
        VideoDemoVG(),
        WebsocketDemoVG(),
        HttpDemoVG(),
        ExternalTestVG(),
//        BleScanDemoVG(stack),
//        PongDemoVG(),
        MarginTestsVG(),
//        MultipleDemoVG(),
        DateButtonDemoVG(),
//        MapDemoVG(),
        LocationDemoVG(),
        LoadImageDemoVG(),
        ControlsDemoVG(),
        ExampleContentVG(),
        ViewPagerDemoVG(stack),
        SegmentedControlDemoVG(),
        SliderDemoVG(),
//        DateRangeDemoVG(),
//        LoginDemoVG(stack),
        DrawableDemoVG(),
        PreviewVG()
    )

    fun selectVG(viewGenerator: ViewGenerator){
        stack.push(viewGenerator)
    }

    override fun generate(dependency: ActivityAccess): View {
        val xml = SelectDemoBinding.inflate(dependency.layoutInflater)
        val view = xml.root

        options.first()
        Observable.just(options).showIn(xml.list){ obs: Observable<ViewGenerator> ->
            val xml = ComponentTestBinding.inflate(dependency.layoutInflater)
            val view = xml.root
            obs.subscribeAutoDispose(xml.label) { setText(it.titleString) }
            xml.button.clicks()
                .flatMap { obs.take(1) }
                .subscribeAutoDispose(view) { selectVG(it) }
            view
        }

        return view
    }
}
