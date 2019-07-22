package com.lightningkite.kwift.shared

import com.lightningkite.kwift.actuals.AnyObject
import com.lightningkite.kwift.actuals.escaping
import com.lightningkite.kwift.actuals.weak

class Event<T> {
    val subscriptions = ArrayList<Subscription<T>>()
    var id: Int = 0

    fun addAndRun(value: T, @escaping listener: (T) -> Unit): Subscription<T> {
        listener(value)
        return add(listener = listener)
    }

    fun add(@escaping listener: (T) -> Unit): Subscription<T> {
        val element = Subscription(listener = { item: T ->
            listener(item);
            return@Subscription false
        }, identifier = id)
        id += 1
        subscriptions.add(element)
        return element
    }

    fun addWithRemovalCondition(@escaping listener: (T) -> Boolean): Subscription<T> {
        val element = Subscription(listener = listener, identifier = id)
        id += 1
        subscriptions.add(element)
        return element
    }

    fun remove(subscription: Subscription<T>) {
        subscriptions.removeAll { it -> it.identifier == subscription.identifier }
    }

    fun invokeAll(value: T) {
        subscriptions.removeAll { subscription ->
            subscription.listener(value)
        }
    }


    fun <A : AnyObject> addWeak(referenceA: A, @escaping listener: (A, T) -> Unit): Subscription<T> {
        val weakA by weak(referenceA);
        val element = Subscription(
            listener = { item: T ->
                val a = weakA;
                if (a != null) {
                    listener(a, item);
                    return@Subscription false
                } else {
                    return@Subscription true
                }
            },
            identifier = id
        )
        id += 1
        subscriptions.add(element)
        return element
    }

    fun <A : AnyObject, B : AnyObject> addWeak(
        referenceA: A,
        referenceB: B, @escaping listener: (A, B, T) -> Unit
    ): Subscription<T> {
        val weakA by weak(referenceA)
        val weakB by weak(referenceB)
        val element = Subscription(
            listener = { item: T ->
                val a = weakA;
                val b = weakB;
                if (a != null && b != null) {
                    listener(a, b, item);
                    return@Subscription false
                } else {
                    return@Subscription true
                }
            },
            identifier = id
        )
        id += 1
        subscriptions.add(element)
        return element
    }

    fun <A : AnyObject, B : AnyObject, C : AnyObject> addWeak(
        referenceA: A,
        referenceB: B,
        referenceC: C, @escaping listener: (A, B, C, T) -> Unit
    ): Subscription<T> {
        val weakA by weak(referenceA)
        val weakB by weak(referenceB)
        val weakC by weak(referenceC)
        val element = Subscription(
            listener = { item: T ->
                val a = weakA;
                val b = weakB;
                val c = weakC;
                if (a != null && b != null && c != null) {
                    listener(a, b, c, item);
                    return@Subscription false
                } else {
                    return@Subscription true
                }
            },
            identifier = id
        )
        id += 1
        subscriptions.add(element)
        return element
    }


    fun <A : AnyObject> addAndRunWeak(
        referenceA: A,
        value: T,
        @escaping listener: (A, T) -> Unit
    ): Subscription<T> {
        listener(referenceA, value)
        val weakA by weak(referenceA);
        val element = Subscription(
            listener = { item: T ->
                val a = weakA;
                if (a != null) {
                    listener(a, item);
                    return@Subscription false
                } else {
                    return@Subscription true
                }
            },
            identifier = id
        )
        id += 1
        subscriptions.add(element)
        return element
    }

    fun <A : AnyObject, B : AnyObject> addAndRunWeak(
        referenceA: A,
        referenceB: B,
        value: T,
        @escaping listener: (A, B, T) -> Unit
    ): Subscription<T> {
        listener(referenceA, referenceB, value)
        val weakA by weak(referenceA)
        val weakB by weak(referenceB)
        val element = Subscription(
            listener = { item: T ->
                val a = weakA;
                val b = weakB;
                if (a != null && b != null) {
                    listener(a, b, item);
                    return@Subscription false
                } else {
                    return@Subscription true
                }
            },
            identifier = id
        )
        id += 1
        subscriptions.add(element)
        return element
    }

    fun <A : AnyObject, B : AnyObject, C : AnyObject> addAndRunWeak(
        referenceA: A,
        referenceB: B,
        referenceC: C,
        value: T,
        @escaping listener: (A, B, C, T) -> Unit
    ): Subscription<T> {
        listener(referenceA, referenceB, referenceC, value)
        val weakA by weak(referenceA)
        val weakB by weak(referenceB)
        val weakC by weak(referenceC)
        val element = Subscription(
            listener = { item: T ->
                val a = weakA;
                val b = weakB;
                val c = weakC;
                if (a != null && b != null && c != null) {
                    listener(a, b, c, item);
                    return@Subscription false
                } else {
                    return@Subscription true
                }
            },
            identifier = id
        )
        id += 1
        subscriptions.add(element)
        return element
    }
}
