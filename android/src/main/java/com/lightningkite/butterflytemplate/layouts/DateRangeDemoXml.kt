//
// DateRangeDemoXml.kt
// Created by Khrysalis XML Android
//
package com.lightningkite.butterflytemplate.layouts

import android.widget.*
import android.view.*
import com.lightningkite.butterfly.views.widget.*
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterfly.android.*
import com.lightningkite.butterflytemplate.R

class DateRangeDemoXml {

    lateinit var month: com.lightningkite.butterfly.views.widget.CustomView
    lateinit var month2: com.lightningkite.butterfly.views.widget.CustomView
    lateinit var month3: com.lightningkite.butterfly.views.widget.CustomView
    lateinit var month4: com.lightningkite.butterfly.views.widget.CustomView
    lateinit var monthDelegate: com.lightningkite.butterfly.views.MonthCVD
    lateinit var month2Delegate: com.lightningkite.butterfly.views.SelectDateMonthCVD
    lateinit var month3Delegate: com.lightningkite.butterfly.views.SelectDateRangeMonthCVD
    lateinit var month4Delegate: com.lightningkite.butterfly.views.SelectMultipleDatesMonthCVD
    
    lateinit var xmlRoot: View

    fun setup(dependency: ActivityAccess): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.date_range_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        month = view.findViewById<com.lightningkite.butterfly.views.widget.CustomView>(R.id.month)
        month2 = view.findViewById<com.lightningkite.butterfly.views.widget.CustomView>(R.id.month2)
        month3 = view.findViewById<com.lightningkite.butterfly.views.widget.CustomView>(R.id.month3)
        month4 = view.findViewById<com.lightningkite.butterfly.views.widget.CustomView>(R.id.month4)
        monthDelegate = view.findViewById<CustomView>(R.id.month).delegate as com.lightningkite.butterfly.views.MonthCVD
        month2Delegate = view.findViewById<CustomView>(R.id.month2).delegate as com.lightningkite.butterfly.views.SelectDateMonthCVD
        month3Delegate = view.findViewById<CustomView>(R.id.month3).delegate as com.lightningkite.butterfly.views.SelectDateRangeMonthCVD
        month4Delegate = view.findViewById<CustomView>(R.id.month4).delegate as com.lightningkite.butterfly.views.SelectMultipleDatesMonthCVD
        
        
        return view
    }
}