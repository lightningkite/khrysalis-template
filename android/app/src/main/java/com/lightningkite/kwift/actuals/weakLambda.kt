package com.lightningkite.kwift.actuals

import java.lang.ref.WeakReference
import kotlin.reflect.KProperty

fun <T> weakLambda(lambda: () -> T) = lambda
fun <A, T> weakLambda(lambda: (A) -> T) = lambda
fun <A, B, T> weakLambda(lambda: (A, B) -> T) = lambda
fun <A, B, C, T> weakLambda(lambda: (A, B, C) -> T) = lambda
fun <A, B, C, D, T> weakLambda(lambda: (A, B, C, D) -> T) = lambda
fun <A, B, C, D, E, T> weakLambda(lambda: (A, B, C, D, E) -> T) = lambda


class WeakPropertyDelegate<T>(initial: T) {
    var ref = WeakReference<T>(initial)
    operator fun getValue(thisRef: Any?, property: KProperty<*>): T? {
        return ref.get()
    }

    operator fun setValue(thisRef: Any?, property: KProperty<*>, value: T?) {
        if (value != null) {
            ref = WeakReference(value)
        }
    }
}

fun <T> weak(value: T) = WeakPropertyDelegate(value)
