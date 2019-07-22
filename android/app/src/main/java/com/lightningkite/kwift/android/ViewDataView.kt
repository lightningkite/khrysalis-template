package com.lightningkite.kwift.android

import android.content.Context
import android.support.annotation.IdRes
import android.support.annotation.LayoutRes
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.ViewGroup.LayoutParams.MATCH_PARENT
import android.widget.*
import br.com.simplepass.loading_button_lib.customViews.CircularProgressImageButton
import com.lightningkite.kwift.shared.ObservableProperty
import com.lightningkite.kwift.shared.ViewData
import com.lightningkite.kwift.shared.ViewDataStack
import com.lightningkite.kwift.toSnakeCase

abstract class ViewDataView<V : ViewData>(context: Context, val data: V) : FrameLayout(context) {

    companion object {
        val onBackPressed = ArrayList<() -> Boolean>()
        fun onBackPressed(): Boolean {
            return onBackPressed.lastOrNull { it() } != null
        }
    }

    //On Init, handle population
//    Loading indicator on button implied?
    fun default() {
        val resourceName = this::class.java.simpleName.removeSuffix("View").toSnakeCase()
        val id = context.resources.getIdentifier(resourceName, "layout", context.packageName)
        if (id != 0) {
            layout(id)
        } else {
            println("Couldn't find resource $resourceName")
        }
    }

    fun layout(@LayoutRes id: Int) {
        LayoutInflater.from(context).inflate(id, this, true)
    }
}
