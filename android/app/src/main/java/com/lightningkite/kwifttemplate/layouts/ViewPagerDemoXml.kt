//
// ViewPagerDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.layouts

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class ViewPagerDemoXml {

    lateinit var viewPager: androidx.viewpager.widget.ViewPager
    lateinit var viewPagerIndicator: com.rd.PageIndicatorView

    lateinit var xmlRoot: View

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.view_pager_demo, null, false)
        return setup(view)
    }
    fun setup(view: View): View {
        xmlRoot = view
        viewPager = view.findViewById<androidx.viewpager.widget.ViewPager>(R.id.viewPager)
        viewPagerIndicator = view.findViewById<com.rd.PageIndicatorView>(R.id.viewPagerIndicator)

        return view
    }
}
