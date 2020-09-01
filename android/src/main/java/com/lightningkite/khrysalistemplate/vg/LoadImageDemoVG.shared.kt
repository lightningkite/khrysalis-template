package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.ImageReference
import com.lightningkite.khrysalis.ImageRemoteUrl
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.layouts.LoadImageDemoXml

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
        xml.galleryMultiple.onClick {
            dependency.requestImagesGallery { urls ->
                urls.firstOrNull()?.let { url ->
                    xml.image.loadImage(ImageReference(url))
                }
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
