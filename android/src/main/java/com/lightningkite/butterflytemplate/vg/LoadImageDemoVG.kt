//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.Image
import com.lightningkite.butterfly.ImageReference
import com.lightningkite.butterfly.ImageRemoteUrl
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.net.toHttpBody
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bindImage
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.observables.map
import com.lightningkite.butterfly.observables.subscribeBy
import com.lightningkite.butterfly.rx.removed
import com.lightningkite.butterfly.rx.until
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterflytemplate.layouts.LoadImageDemoXml
import io.reactivex.rxkotlin.subscribeBy

class LoadImageDemoVG : ViewGenerator() {
    override val title: String get() = "Load Image Demo"

    val canUpload = StandardObservableProperty<Boolean?>(null)
    val currentImage = StandardObservableProperty<Image?>(null)

    override fun generate(dependency: ActivityAccess): View {
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
