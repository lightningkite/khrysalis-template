package com.lightningkite.kwift.views.android

import android.content.Context
import android.support.design.widget.TabLayout
import android.util.AttributeSet

class SegmentedControl : TabLayout {
    constructor(context: Context) : super(context) { sharedInit() }
    constructor(context: Context, attrs: AttributeSet) : super(context, attrs) { sharedInit() }
    constructor(context: Context, attrs: AttributeSet, defStyleAttr: Int) : super(context, attrs, defStyleAttr) { sharedInit() }

    fun sharedInit(){

    }
}
