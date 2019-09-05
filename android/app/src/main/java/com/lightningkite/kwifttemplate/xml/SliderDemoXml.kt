//
// SliderDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import android.widget.SeekBar
import android.widget.TextView
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class SliderDemoXml {

    lateinit var slider: SeekBar
    lateinit var valueDisplay: TextView
    lateinit var rating: com.lightningkite.kwift.views.android.ColorRatingBar
    lateinit var ratingDisplayStars: com.lightningkite.kwift.views.android.ColorRatingBar
    lateinit var ratingDisplayStarsSmall: com.lightningkite.kwift.views.android.ColorRatingBar
    lateinit var ratingDisplayNumber: TextView
    lateinit var ratingFloat: com.lightningkite.kwift.views.android.ColorRatingBar
    lateinit var ratingDisplayStarsFloat: com.lightningkite.kwift.views.android.ColorRatingBar
    lateinit var ratingDisplayStarsSmallFloat: com.lightningkite.kwift.views.android.ColorRatingBar
    lateinit var ratingDisplayNumberFloat: TextView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.slider_demo, null, false)
        slider = view.findViewById<SeekBar>(R.id.slider)
        valueDisplay = view.findViewById<TextView>(R.id.valueDisplay)
        rating = view.findViewById<com.lightningkite.kwift.views.android.ColorRatingBar>(R.id.rating)
        ratingDisplayStars =
            view.findViewById<com.lightningkite.kwift.views.android.ColorRatingBar>(R.id.ratingDisplayStars)
        ratingDisplayStarsSmall =
            view.findViewById<com.lightningkite.kwift.views.android.ColorRatingBar>(R.id.ratingDisplayStarsSmall)
        ratingDisplayNumber = view.findViewById<TextView>(R.id.ratingDisplayNumber)
        ratingFloat = view.findViewById<com.lightningkite.kwift.views.android.ColorRatingBar>(R.id.ratingFloat)
        ratingDisplayStarsFloat =
            view.findViewById<com.lightningkite.kwift.views.android.ColorRatingBar>(R.id.ratingDisplayStarsFloat)
        ratingDisplayStarsSmallFloat =
            view.findViewById<com.lightningkite.kwift.views.android.ColorRatingBar>(R.id.ratingDisplayStarsSmallFloat)
        ratingDisplayNumberFloat = view.findViewById<TextView>(R.id.ratingDisplayNumberFloat)
        return view
    }
}