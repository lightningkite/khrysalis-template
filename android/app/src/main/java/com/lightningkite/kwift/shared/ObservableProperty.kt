package com.lightningkite.kwift.shared

import com.lightningkite.kwift.actuals.AnyObject
import com.lightningkite.kwift.actuals.escaping
import com.lightningkite.kwift.actuals.weak
import com.lightningkite.kwift.actuals.weakLambda

class ObservableProperty<T>(var underlyingValue: T) {
    val onChange = Event<T>()
    var value: T
        get() = underlyingValue
        set(value) {
            underlyingValue = value
            onChange.invokeAll(value = value)
        }


    fun <A : AnyObject> addAndRunWeak(
        referenceA: A,
        @escaping listener: (A, T) -> Unit
    ): Subscription<T> = onChange.addAndRunWeak(
        referenceA = referenceA,
        value = value,
        listener = listener
    )

    fun <A : AnyObject, B : AnyObject> addAndRunWeak(
        referenceA: A,
        referenceB: B,
        @escaping listener: (A, B, T) -> Unit
    ): Subscription<T> = onChange.addAndRunWeak(
        referenceA = referenceA,
        referenceB = referenceB,
        value = value,
        listener = listener
    )

    fun <A : AnyObject, B : AnyObject, C : AnyObject> addAndRunWeak(
        referenceA: A,
        referenceB: B,
        referenceC: C,
        @escaping listener: (A, B, C, T) -> Unit
    ): Subscription<T> = onChange.addAndRunWeak(
        referenceA = referenceA,
        referenceB = referenceB,
        referenceC = referenceC,
        value = value,
        listener = listener
    )


    fun <A> calculatedBy(
        a: ObservableProperty<A>,
        @escaping calculation: (A) -> T
    ): ObservableProperty<T> {
        this.value = calculation(a.value)
        a.onChange.add(listener = weakLambda { aValue ->
            this.value = calculation(aValue)
        })
        return this
    }

    fun <A, B> calculatedBy(
        a: ObservableProperty<A>,
        b: ObservableProperty<B>,
        @escaping calculation: (A, B) -> T
    ): ObservableProperty<T> {
        this.value = calculation(a.value, b.value)
        val aWeak by weak(a)
        val bWeak by weak(b)
        a.onChange.add(listener = weakLambda { aValue ->
            val bValue = bWeak?.value;
            if (bValue != null) {
                this.value = calculation(aValue, bValue)
            }
        })
        b.onChange.add(listener = weakLambda { bValue ->
            val aValue = aWeak?.value;
            if (aValue != null) {
                this.value = calculation(aValue, bValue)
            }
        })
        return this
    }

    fun <A, B, C> calculatedBy(
        a: ObservableProperty<A>,
        b: ObservableProperty<B>,
        c: ObservableProperty<C>,
        @escaping calculation: (A, B, C) -> T
    ): ObservableProperty<T> {
        this.value = calculation(a.value, b.value, c.value)
        val aWeak by weak(a)
        val bWeak by weak(b)
        val cWeak by weak(c)
        a.onChange.add(listener = weakLambda { aValue ->
            val bValue = bWeak?.value;
            val cValue = cWeak?.value;
            if (bValue != null) {
                if (cValue != null) {
                    this.value = calculation(aValue, bValue, cValue)
                }
            }
        })
        b.onChange.add(listener = weakLambda { bValue ->
            val aValue = aWeak?.value;
            val cValue = cWeak?.value;
            if (aValue != null && cValue != null) {
                this.value = calculation(aValue, bValue, cValue)
            }
        })
        c.onChange.add(listener = weakLambda { cValue ->
            val aValue = aWeak?.value;
            val bValue = bWeak?.value;
            if (aValue != null && bValue != null) {
                this.value = calculation(aValue, bValue, cValue)
            }
        })
        return this
    }

    fun <A, B, C, D> calculatedBy(
        a: ObservableProperty<A>,
        b: ObservableProperty<B>,
        c: ObservableProperty<C>,
        d: ObservableProperty<D>,
        @escaping calculation: (A, B, C, D) -> T
    ): ObservableProperty<T> {
        this.value = calculation(a.value, b.value, c.value, d.value)
        val aWeak by weak(a)
        val bWeak by weak(b)
        val cWeak by weak(c)
        val dWeak by weak(d)
        a.onChange.add(listener = weakLambda { aValue ->
            val bValue = bWeak?.value;
            val cValue = cWeak?.value;
            val dValue = dWeak?.value;
            if (bValue != null && cValue != null && dValue != null) {
                this.value = calculation(aValue, bValue, cValue, dValue)
            }
        })
        b.onChange.add(listener = weakLambda { bValue ->
            val aValue = aWeak?.value;
            val cValue = cWeak?.value;
            val dValue = dWeak?.value;
            if (aValue != null && cValue != null && dValue != null) {
                this.value = calculation(aValue, bValue, cValue, dValue)
            }
        })
        c.onChange.add(listener = weakLambda { cValue ->
            val aValue = aWeak?.value;
            val bValue = bWeak?.value;
            val dValue = dWeak?.value;
            if (aValue != null && bValue != null && dValue != null) {
                this.value = calculation(aValue, bValue, cValue, dValue)
            }
        })
        d.onChange.add(listener = weakLambda { dValue ->
            val aValue = aWeak?.value;
            val bValue = bWeak?.value;
            val cValue = cWeak?.value;
            if (aValue != null && bValue != null && cValue != null) {
                this.value = calculation(aValue, bValue, cValue, dValue)
            }
        })
        return this
    }
}
