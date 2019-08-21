package com.lightningkite.kwift.observables.shared

import com.lightningkite.kwift.actuals.escaping

class TransformedObservableProperty<A, B>(
    val basedOn: ObservableProperty<A>,
    val transformation: @escaping() (A) -> B
) : ObservableProperty<B>() {
    override val value: B
        get() {
            return transformation(basedOn.value)
        }
    override val onChange: Event<B> = basedOn.onChange.transformed(transformation = transformation)
}

fun <T, B> ObservableProperty<T>.transformed(transformation: @escaping() (T) -> B): ObservableProperty<B> {
    return TransformedObservableProperty<T, B>(this, transformation)
}
