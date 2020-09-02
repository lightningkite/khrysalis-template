package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.Image
import com.lightningkite.khrysalis.ImageReference
import com.lightningkite.khrysalis.ImageRemoteUrl
import com.lightningkite.khrysalis.net.toHttpBody
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.observables.binding.bindImage
import com.lightningkite.khrysalis.observables.binding.bindString
import com.lightningkite.khrysalis.observables.map
import com.lightningkite.khrysalis.observables.subscribeBy
import com.lightningkite.khrysalis.rx.removed
import com.lightningkite.khrysalis.rx.until
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.layouts.LoadImageDemoXml
import io.reactivex.rxkotlin.subscribeBy

class LoadImageDemoVG : ViewGenerator() {
    override val title: String get() = "Load Image Demo"

    val canUpload = StandardObservableProperty<Boolean?>(null)
    val currentImage = StandardObservableProperty<Image?>(null)

    override fun generate(dependency: ViewDependency): View {
        val xml = LoadImageDemoXml()
        val view = xml.setup(dependency)

        currentImage.subscribeBy {
            canUpload.value = null
        }.until(view.removed)

        xml.image.bindImage(currentImage)
        xml.camera.onClick {
            dependency.requestImageCamera { url ->
                currentImage.value = ImageReference(url)
            }
        }
        xml.galleryMultiple.onClick {
            dependency.requestImagesGallery { urls ->
                urls.firstOrNull()?.let { url ->
                    currentImage.value = ImageReference(url)
                }
            }
        }
        xml.gallery.onClick {
            dependency.requestImageGallery { url ->
                currentImage.value = ImageReference(url)
            }
        }
        xml.loremPixel.onClick {
            currentImage.value = ImageRemoteUrl("https://picsum.photos/200")
        }
        xml.checkCanUpload.onClick {
            currentImage.value?.let { i ->
                i.toHttpBody().subscribeBy(
                        onError = {
                            it.printStackTrace()
                            canUpload.value = false
                        },
                        onSuccess = {
                            canUpload.value = true
                        }
                )
            }
        }
        xml.canUpload.bindString(canUpload.map {
            if(it == null) "Not checked" else if(it == true) "Good to go!" else "FAILED!!!"
        })
        return view
    }
}
