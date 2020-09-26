//
// SliderDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class SliderDemoXml {

    lateinit var slider: SeekBar
    lateinit var valueDisplay: TextView
    lateinit var progress: com.lightningkite.butterfly.views.widget.HorizontalProgressBar
    lateinit var rating: com.lightningkite.butterfly.views.widget.ColorRatingBar
    lateinit var ratingDisplayStars: com.lightningkite.butterfly.views.widget.ColorRatingBar
    lateinit var ratingDisplayStarsSmall: com.lightningkite.butterfly.views.widget.ColorRatingBar
    lateinit var ratingDisplayNumber: TextView
    lateinit var ratingFloat: com.lightningkite.butterfly.views.widget.ColorRatingBar
    lateinit var ratingDisplayStarsFloat: com.lightningkite.butterfly.views.widget.ColorRatingBar
    lateinit var ratingDisplayStarsSmallFloat: com.lightningkite.butterfly.views.widget.ColorRatingBar
    lateinit var ratingDisplayNumberFloat: TextView
    
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.slider_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        slider = view.findViewById<SeekBar>(R.id.slider)
        valueDisplay = view.findViewById<TextView>(R.id.valueDisplay)
        progress = view.findViewById<com.lightningkite.butterfly.views.widget.HorizontalProgressBar>(R.id.progress)
        rating = view.findViewById<com.lightningkite.butterfly.views.widget.ColorRatingBar>(R.id.rating)
        ratingDisplayStars = view.findViewById<com.lightningkite.butterfly.views.widget.ColorRatingBar>(R.id.ratingDisplayStars)
        ratingDisplayStarsSmall = view.findViewById<com.lightningkite.butterfly.views.widget.ColorRatingBar>(R.id.ratingDisplayStarsSmall)
        ratingDisplayNumber = view.findViewById<TextView>(R.id.ratingDisplayNumber)
        ratingFloat = view.findViewById<com.lightningkite.butterfly.views.widget.ColorRatingBar>(R.id.ratingFloat)
        ratingDisplayStarsFloat = view.findViewById<com.lightningkite.butterfly.views.widget.ColorRatingBar>(R.id.ratingDisplayStarsFloat)
        ratingDisplayStarsSmallFloat = view.findViewById<com.lightningkite.butterfly.views.widget.ColorRatingBar>(R.id.ratingDisplayStarsSmallFloat)
        ratingDisplayNumberFloat = view.findViewById<TextView>(R.id.ratingDisplayNumberFloat)
        
        
        
        return view
    }
}