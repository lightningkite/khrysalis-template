package com.lightningkite.kwift.android

import android.content.Context
import android.util.Log
import android.view.View
import com.lightningkite.kwift.shared.ViewData

fun <V : ViewData> V.view(context: Context): ViewDataView<V> {
    val name = this::class.java.name.removeSuffix("Data").replace(".shared.", ".android.")
    Log.i("ViewDataView.ext", "Looking for $name...")
    val clazz = Class.forName(name)
    @Suppress("UNCHECKED_CAST")
    return clazz.getConstructor(Context::class.java, this::class.java).newInstance(context, this) as ViewDataView<V>
}
