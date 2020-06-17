package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.escaping
import com.lightningkite.khrysalis.observables.binding.bind
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.observables.addAndRunWeak
import com.lightningkite.khrysalis.observables.subscribeBy
import com.lightningkite.khrysalis.rx.removed
import com.lightningkite.khrysalis.rx.until
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.*

class PreviewVG : ViewGenerator() {
    override val title: String
        get() = "Preview"

    class XmlPreview(val name: String, val make: @escaping() (ViewDependency) -> View)

    val previews: List<XmlPreview> = listOf(
        XmlPreview("ControlsDemoXml") { it -> ControlsDemoXml().setup(it) },
        XmlPreview("DateRangeDemoXml") { it -> DateRangeDemoXml().setup(it) },
        XmlPreview("ExampleContentXml") { it -> ExampleContentXml().setup(it) },
        XmlPreview("LoginDemoXml") { it -> LoginDemoXml().setup(it) },
        XmlPreview("MainXml") { it -> MainXml().setup(it) },
        XmlPreview("SegmentedControlDemoXml") { it -> SegmentedControlDemoXml().setup(it) },
        XmlPreview("SelectDemoXml") { it -> SelectDemoXml().setup(it) },
        XmlPreview("SliderDemoXml") { it -> SliderDemoXml().setup(it) },
        XmlPreview("ViewPagerDemoXml") { it -> ViewPagerDemoXml().setup(it) }
    )

    val previewIndex: StandardObservableProperty<Int> = StandardObservableProperty(0)

    override fun generate(dependency: ViewDependency): View {
        val xml = PreviewXml()
        val view = xml.setup(dependency)
        xml.pager.bind(previews, previewIndex) { it -> it.make(dependency) }
        previewIndex.subscribeBy { it ->
            xml.viewName.text = this.previews[it].name
        }.until(view.removed)
        return view
    }

}
