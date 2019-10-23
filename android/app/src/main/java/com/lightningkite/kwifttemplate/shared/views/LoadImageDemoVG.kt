package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.actual.loadUrl
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.shared.captureWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.actual.requestImageCamera
import com.lightningkite.kwift.views.actual.requestImageGallery
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.LoadImageDemoXml

class LoadImageDemoVG : ViewGenerator() {
    override val title: String get() = "Load Image Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = LoadImageDemoXml()
        val view = xml.setup(dependency)
        xml.camera.onClick {
            dependency.requestImageCamera { url ->
                xml.image.loadUrl(url.toString())
            }
        }
        xml.gallery.onClick {
            dependency.requestImageGallery { url ->
                xml.image.loadUrl(url.toString())
            }
        }
        return view
    }
}
