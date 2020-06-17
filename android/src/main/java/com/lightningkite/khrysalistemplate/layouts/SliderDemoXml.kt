//
// SliderDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class SliderDemoXml {

    lateinit var slider: SeekBar
    lateinit var valueDisplay: TextView
    lateinit var rating: com.lightningkite.khrysalis.views.android.ColorRatingBar
    lateinit var ratingDisplayStars: com.lightningkite.khrysalis.views.android.ColorRatingBar
    lateinit var ratingDisplayStarsSmall: com.lightningkite.khrysalis.views.android.ColorRatingBar
    lateinit var ratingDisplayNumber: TextView
    lateinit var ratingFloat: com.lightningkite.khrysalis.views.android.ColorRatingBar
    lateinit var ratingDisplayStarsFloat: com.lightningkite.khrysalis.views.android.ColorRatingBar
    lateinit var ratingDisplayStarsSmallFloat: com.lightningkite.khrysalis.views.android.ColorRatingBar
    lateinit var ratingDisplayNumberFloat: TextView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.slider_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        slider = view.findViewById<SeekBar>(R.id.slider)
        valueDisplay = view.findViewById<TextView>(R.id.valueDisplay)
        rating = view.findViewById<com.lightningkite.khrysalis.views.android.ColorRatingBar>(R.id.rating)
        ratingDisplayStars = view.findViewById<com.lightningkite.khrysalis.views.android.ColorRatingBar>(R.id.ratingDisplayStars)
        ratingDisplayStarsSmall = view.findViewById<com.lightningkite.khrysalis.views.android.ColorRatingBar>(R.id.ratingDisplayStarsSmall)
        ratingDisplayNumber = view.findViewById<TextView>(R.id.ratingDisplayNumber)
        ratingFloat = view.findViewById<com.lightningkite.khrysalis.views.android.ColorRatingBar>(R.id.ratingFloat)
        ratingDisplayStarsFloat = view.findViewById<com.lightningkite.khrysalis.views.android.ColorRatingBar>(R.id.ratingDisplayStarsFloat)
        ratingDisplayStarsSmallFloat = view.findViewById<com.lightningkite.khrysalis.views.android.ColorRatingBar>(R.id.ratingDisplayStarsSmallFloat)
        ratingDisplayNumberFloat = view.findViewById<TextView>(R.id.ratingDisplayNumberFloat)
        
        
        
        return view
    }
}