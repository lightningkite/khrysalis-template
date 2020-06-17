//
// DateRangeDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.khrysalistemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R

class DateRangeDemoXml {

    lateinit var month: com.lightningkite.khrysalis.views.CustomView
    lateinit var month2: com.lightningkite.khrysalis.views.CustomView
    lateinit var month3: com.lightningkite.khrysalis.views.CustomView
    lateinit var month4: com.lightningkite.khrysalis.views.CustomView
    lateinit var monthDelegate: com.lightningkite.khrysalis.views.MonthCVD
    lateinit var month2Delegate: com.lightningkite.khrysalis.views.SelectDateMonthCVD
    lateinit var month3Delegate: com.lightningkite.khrysalis.views.SelectDateRangeMonthCVD
    lateinit var month4Delegate: com.lightningkite.khrysalis.views.SelectMultipleDatesMonthCVD
    
    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        month = view.findViewById<com.lightningkite.khrysalis.views.CustomView>(R.id.month)
        month2 = view.findViewById<com.lightningkite.khrysalis.views.CustomView>(R.id.month2)
        month3 = view.findViewById<com.lightningkite.khrysalis.views.CustomView>(R.id.month3)
        month4 = view.findViewById<com.lightningkite.khrysalis.views.CustomView>(R.id.month4)
        monthDelegate = view.findViewById<CustomView>(R.id.month).delegate as com.lightningkite.khrysalis.views.MonthCVD
        month2Delegate = view.findViewById<CustomView>(R.id.month2).delegate as com.lightningkite.khrysalis.views.SelectDateMonthCVD
        month3Delegate = view.findViewById<CustomView>(R.id.month3).delegate as com.lightningkite.khrysalis.views.SelectDateRangeMonthCVD
        month4Delegate = view.findViewById<CustomView>(R.id.month4).delegate as com.lightningkite.khrysalis.views.SelectMultipleDatesMonthCVD
        
        
        return view
    }
}