package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindFloat
import com.lightningkite.kwift.observables.actual.bindText
import com.lightningkite.kwift.observables.shared.MutableObservableProperty
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.observables.shared.transformed
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.xml.SliderDemoXml

class SliderDemoVG() : ViewGenerator() {
    override val title: String get() = "Slider Demo"

    val ratio: StandardObservableProperty<Float> = StandardObservableProperty(0f)
    val percent: MutableObservableProperty<Int> = ratio.transformed(
        read = { it -> (it * 100).toInt() },
        write = { it -> it.toFloat() / 100f }
    )
    val obsRatingInt: MutableObservableProperty<Int> = ratio.transformed(
        read = { it -> (it * 5).toInt() },
        write = { it -> it.toFloat() / 5f }
    )
    val obsRatingFloat: MutableObservableProperty<Float> = ratio.transformed(
        read = { it -> it * 5f },
        write = { it -> it / 5f }
    )

    override fun generate(dependency: ViewDependency): View {
        val xml = SliderDemoXml()
        val view = xml.setup(dependency)

        xml.slider.bind(0, 100, percent)
        xml.valueDisplay.bindText(percent) { it -> it.toString() }

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
