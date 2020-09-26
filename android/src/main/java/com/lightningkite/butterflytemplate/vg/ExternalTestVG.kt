//! This file will translate using Khrysalis.
//
// ExternalTestVG.swift
// Created by Butterfly Prototype Generator
// Sections of this file can be replaces if the marker, '(overwritten on flow generation)', is left in place.
//
package com.lightningkite.butterflytemplate.vg

//--- Imports

import android.view.View
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.location.GeoCoordinate
import com.lightningkite.butterfly.time.addDayOfMonth
import com.lightningkite.butterfly.time.hourOfDay
import com.lightningkite.butterfly.time.minuteOfHour
import com.lightningkite.butterfly.time.secondOfMinute
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterflytemplate.layouts.ExternalTestXml
import java.util.*

//--- Name (overwritten on flow generation)
@Suppress("NAME_SHADOWING")
class ExternalTestVG(
    //--- Dependencies (overwritten on flow generation)
    //--- Extends (overwritten on flow generation)
) : ViewGenerator() {
    
    
    //--- Title (overwritten on flow generation)
    override val title: String get() = "External Test"
    
    //--- Generate Start (overwritten on flow generation)
    override fun generate(dependency: ActivityAccess): View {
        val xml = ExternalTestXml()
        val view = xml.setup(dependency)
        
        //--- Set Up xml.scrollView (overwritten on flow generation)
        
        //--- Set Up xml.openMap
        xml.openMap.onClick {
            dependency.openMap(GeoCoordinate(41.7269, -111.8432), "Lightning Kite", 14f)
        }

        //--- Set Up xml.openWeb
        xml.openWeb.onClick {
            dependency.openUrl("https://lightningkite.com")
        }

        //--- Set Up xml.openEvent
        xml.openEvent.onClick {
            dependency.openEvent(
                title = "A Virtual Lunch with LK",
                description = "Come eat virtual food with us!",
                location = "Lightning Kite in Logan Utah",
                start = Date().addDayOfMonth(1).hourOfDay(12).minuteOfHour(0).secondOfMinute(0),
                end = Date().addDayOfMonth(1).hourOfDay(13).minuteOfHour(0).secondOfMinute(0)
            )
        }

        //--- Generate End (overwritten on flow generation)
        
        return view
    }
    
    //--- Init

    init {
        //--- Init End
    }

    //--- Actions

    //--- Action openMapClick
    //--- Action openWebClick
    //--- Action openEventClick

    //--- Body End
}
