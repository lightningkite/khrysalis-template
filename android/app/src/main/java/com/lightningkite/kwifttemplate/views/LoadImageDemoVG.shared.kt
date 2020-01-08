package com.lightningkite.kwifttemplate.views

import android.view.View
import com.lightningkite.kwift.observables.binding.bindText
import com.lightningkite.kwift.observables.binding.loadImage
import com.lightningkite.kwift.observables.StandardObservableProperty
import com.lightningkite.kwift.ImageReference
import com.lightningkite.kwift.ImageRemoteUrl
import com.lightningkite.kwift.captureWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.onClick
import com.lightningkite.kwift.views.requestImageCamera
import com.lightningkite.kwift.views.requestImageGallery
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.LoadImageDemoXml

class LoadImageDemoVG : ViewGenerator() {
    override val title: String get() = "Load Image Demo"

    override fun generate(dependency: ViewDependency): View {
        val xml = LoadImageDemoXml()
        val view = xml.setup(dependency)
        xml.camera.onClick {
            dependency.requestImageCamera { url ->
                xml.image.loadImage(ImageReference(url))
            }
        }
        xml.gallery.onClick {
            dependency.requestImageGallery { url ->
                xml.image.loadImage(ImageReference(url))
            }
        }
        xml.loremPixel.onClick {
            xml.image.loadImage(ImageRemoteUrl("https://picsum.photos/200"))
        }
        return view
    }
}
