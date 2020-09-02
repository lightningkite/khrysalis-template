package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.observables.binding.bind
import com.lightningkite.khrysalis.observables.binding.bindFloat
import com.lightningkite.khrysalis.observables.binding.bindText
import com.lightningkite.khrysalis.observables.MutableObservableProperty
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.observables.map
import com.lightningkite.khrysalis.observables.transformed
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalistemplate.layouts.SliderDemoXml

class SliderDemoVG() : ViewGenerator() {
    override val title: String get() = "Slider Demo"

    val ratio: StandardObservableProperty<Float> = StandardObservableProperty(0f)
    val percent: MutableObservableProperty<Int> = ratio.map(
        read = { it -> (it * 100).toInt() },
        write = { it -> it.toFloat() / 100f }
    )
    val obsRatingInt: MutableObservableProperty<Int> = ratio.map(
        read = { it -> (it * 5).toInt() },
        write = { it -> it.toFloat() / 5f }
    )
    val obsRatingFloat: MutableObservableProperty<Float> = ratio.map(
        read = { it -> it * 5f },
        write = { it -> it / 5f }
    )

    override fun generate(dependency: ViewDependency): View {
        val xml = SliderDemoXml()
        val view = xml.setup(dependency)

        xml.slider.bind(0, 100, percent)
        xml.valueDisplay.bindText(percent) { it -> it.toString() }
        xml.progress.bindFloat(ratio)

        xml.rating.bind(5, obsRatingInt)
        xml.ratingDisplayStars.bind(5, obsRatingInt)
        xml.ratingDisplayStarsSmall.bind(5, obsRatingInt)
        xml.ratingDisplayNumber.bindText(obsRatingInt) { it -> it.toString() }

        xml.ratingFloat.bindFloat(5, obsRatingFloat)
        xml.ratingDisplayStarsFloat.bindFloat(5, obsRatingFloat)
        xml.ratingDisplayStarsSmallFloat.bindFloat(5, obsRatingFloat)
        xml.ratingDisplayNumberFloat.bindText(obsRatingFloat) { it -> it.toString() }

        return view
    }
}
