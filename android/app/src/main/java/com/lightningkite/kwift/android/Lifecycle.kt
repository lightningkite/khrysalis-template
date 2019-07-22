package com.lightningkite.kwift.android

import android.view.View
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwift.shared.ObservableProperty

val View.lifecycle: ObservableProperty<Boolean>
    get() {
        val existing = this.getTag(R.id.lifecycle) as? ObservableProperty<Boolean>
        if (existing != null) return existing

        val obs = ObservableProperty(false)
        addOnAttachStateChangeListener(object : View.OnAttachStateChangeListener {
            override fun onViewDetachedFromWindow(v: View?) {
                obs.value = false
            }

            override fun onViewAttachedToWindow(v: View?) {
                obs.value = true
            }
        })
        this.setTag(R.id.lifecycle, obs)
        return obs
    }
