//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.Escaping
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.subscribeBy
import com.lightningkite.butterfly.rx.removed
import com.lightningkite.butterfly.rx.until
import com.lightningkite.butterfly.views.ViewGenerator
import com.lightningkite.butterflytemplate.layouts.*

class PreviewVG : ViewGenerator() {
    override val title: String
        get() = "Preview"

    class XmlPreview(val name: String, val make: @Escaping() (ActivityAccess) -> View)

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

    override fun generate(dependency: ActivityAccess): View {
        val xml = PreviewXml()
        val view = xml.setup(dependency)
        xml.pager.bind(previews, previewIndex) { it -> it.make(dependency) }
        previewIndex.subscribeBy { it ->
            xml.viewName.text = this.previews[it].name
        }.until(view.removed)
        return view
    }

}
