package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.escaping
import com.lightningkite.kwift.observables.binding.bind
import com.lightningkite.kwift.observables.StandardObservableProperty
import com.lightningkite.kwift.observables.addAndRunWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.*

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
        XmlPreview("RowTestXml") { it -> RowTestXml().setup(it) },
        XmlPreview("RowTextXml") { it -> RowTextXml().setup(it) },
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
        previewIndex.addAndRunWeak(this, xml.viewName) { self, view, it ->
            view.text = self.previews[it].name
        }
        return view
    }

}
