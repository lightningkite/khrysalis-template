//
// ViewPagerDemoXml.swift
// Created by Kwift XML Android
//
package com.lightningkite.kwifttemplate.xml

import android.view.LayoutInflater
import android.view.View
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwifttemplate.R

class ViewPagerDemoXml {

    lateinit var viewPager: android.support.v4.view.ViewPager
    lateinit var viewPagerIndicator: com.rd.PageIndicatorView

    fun setup(dependency: ViewDependency): View {
        val view = LayoutInflater.from(dependency.context).inflate(R.layout.view_pager_demo, null, false)
        viewPager = view.findViewById<android.support.v4.view.ViewPager>(R.id.viewPager)
        viewPagerIndicator = view.findViewById<com.rd.PageIndicatorView>(R.id.viewPagerIndicator)
        return view
    }
}