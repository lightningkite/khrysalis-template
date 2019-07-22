package com.lightningkite.kwift.android

import com.lightningkite.kwift.shared.Event
import com.lightningkite.kwift.shared.ObservableProperty
import com.lightningkite.kwift.shared.Subscription

fun <T> ObservableProperty<Boolean>.listen(collection: MutableCollection<T>, listener: T): Subscription<Boolean> {
    var bound = false
    return this.onChange.add { on ->
        if (on && !bound) {
            collection.add(listener)
            bound = true
        } else if (!on && bound) {
            collection.remove(listener)
            bound = false
        }
    }
}
fun <T> ObservableProperty<Boolean>.listen(event: Event<T>, listener: (T) -> Unit): Subscription<Boolean> {
    var sub: Subscription<T>? = null
    return this.onChange.add { on ->
        if (on && sub == null) {
            sub = event.add(listener)
        } else if (!on && sub != null) {
            event.remove(sub!!)
            sub = null
        }
    }
}

fun <T> ObservableProperty<Boolean>.bind(event: Event<T>, now: T, listener: (T) -> Unit): Subscription<Boolean> {
    listener.invoke(now)
    return listen(event, listener)
}

fun <T> ObservableProperty<Boolean>.bind(
    observableProperty: ObservableProperty<T>,
    listener: (T) -> Unit
): Subscription<Boolean> {
    listener(observableProperty.value)
    return listen(event = observableProperty.onChange, listener = listener)
}
