import Foundation
//package com.lightningkite.kwift.shared


//import com.lightningkite.kwift.actuals.AnyObject
//import com.lightningkite.kwift.actuals.escaping
//import com.lightningkite.kwift.actuals.weak
//import com.lightningkite.kwift.actuals.weakLambda

final public class ObservableProperty<T> {
    
    public var underlyingValue: T
    
    init( underlyingValue: T) {
        self.underlyingValue = underlyingValue
    }
    convenience init(
        _ underlyingValue: T
    ){ 
        self.init(
            underlyingValue: underlyingValue
        ) 
    }
    
    var onChange = Event<T>()
    var value: T {
        
        get { return underlyingValue }
        set(value) {
            underlyingValue = value
            onChange.invokeAll(value : value)
        }
    }
    
    
    
    func addAndRunWeak<A : AnyObject>(
        referenceA: A,
        listener: @escaping (A, T) -> Void
    ) -> Subscription<T> { return onChange.addAndRunWeak(
        referenceA : referenceA,
        value : value,
        listener : listener
    ) }
    func addAndRunWeak<A : AnyObject>(
        _ referenceA: A,
        _ listener: @escaping (A, T) -> Void
    ) -> Subscription<T> { return addAndRunWeak(referenceA: referenceA, listener: listener) }
    
    func addAndRunWeak<A : AnyObject, B : AnyObject>(
        referenceA: A,
        referenceB: B,
        listener: @escaping (A, B, T) -> Void
    ) -> Subscription<T> { return onChange.addAndRunWeak(
        referenceA : referenceA,
        referenceB : referenceB,
        value : value,
        listener : listener
    ) }
    func addAndRunWeak<A : AnyObject, B : AnyObject>(
        _ referenceA: A,
        _ referenceB: B,
        _ listener: @escaping (A, B, T) -> Void
    ) -> Subscription<T> { return addAndRunWeak(referenceA: referenceA, referenceB: referenceB, listener: listener) }
    
    func addAndRunWeak<A : AnyObject, B : AnyObject, C : AnyObject>(
        referenceA: A,
        referenceB: B,
        referenceC: C,
        listener: @escaping (A, B, C, T) -> Void
    ) -> Subscription<T> { return onChange.addAndRunWeak(
        referenceA : referenceA,
        referenceB : referenceB,
        referenceC : referenceC,
        value : value,
        listener : listener
    ) }
    func addAndRunWeak<A : AnyObject, B : AnyObject, C : AnyObject>(
        _ referenceA: A,
        _ referenceB: B,
        _ referenceC: C,
        _ listener: @escaping (A, B, C, T) -> Void
    ) -> Subscription<T> { return addAndRunWeak(referenceA: referenceA, referenceB: referenceB, referenceC: referenceC, listener: listener) }
    
    
    func calculatedBy<A>(
        a: ObservableProperty<A>,
        calculation: @escaping (A) -> T
    ) -> ObservableProperty<T> {
        self.value = calculation(a.value)
        a.onChange.add(listener : { [weak self] (aValue) in
            if let self = self {
                self.value = calculation(aValue)
                
            }
        })
        return self
    }
    func calculatedBy<A>(
        _ a: ObservableProperty<A>,
        _ calculation: @escaping (A) -> T
    ) -> ObservableProperty<T> { return calculatedBy(a: a, calculation: calculation) }
    
    func calculatedBy<A, B>(
        a: ObservableProperty<A>,
        b: ObservableProperty<B>,
        calculation: @escaping (A, B) -> T
    ) -> ObservableProperty<T> {
        self.value = calculation(a.value, b.value)
        weak var aWeak = a
        weak var bWeak = b
        a.onChange.add(listener : { [weak self] (aValue) in
            if let self = self {
                var bValue = bWeak?.value;
                if let bValue = bValue {
                    self.value = calculation(aValue, bValue)
                }
                
            }
        })
        b.onChange.add(listener : { [weak self] (bValue) in
            if let self = self {
                var aValue = aWeak?.value;
                if let aValue = aValue {
                    self.value = calculation(aValue, bValue)
                }
                
            }
        })
        return self
    }
    func calculatedBy<A, B>(
        _ a: ObservableProperty<A>,
        _ b: ObservableProperty<B>,
        _ calculation: @escaping (A, B) -> T
    ) -> ObservableProperty<T> { return calculatedBy(a: a, b: b, calculation: calculation) }
    
    func calculatedBy<A, B, C>(
        a: ObservableProperty<A>,
        b: ObservableProperty<B>,
        c: ObservableProperty<C>,
        calculation: @escaping (A, B, C) -> T
    ) -> ObservableProperty<T> {
        self.value = calculation(a.value, b.value, c.value)
        weak var aWeak = a
        weak var bWeak = b
        weak var cWeak = c
        a.onChange.add(listener : { [weak self] (aValue) in
            if let self = self {
                var bValue = bWeak?.value;
                var cValue = cWeak?.value;
                if let bValue = bValue {
                    if let cValue = cValue {
                        self.value = calculation(aValue, bValue, cValue)
                    }
                }
                
            }
        })
        b.onChange.add(listener : { [weak self] (bValue) in
            if let self = self {
                var aValue = aWeak?.value;
                var cValue = cWeak?.value;
                if let aValue = aValue, let cValue = cValue {
                    self.value = calculation(aValue, bValue, cValue)
                }
                
            }
        })
        c.onChange.add(listener : { [weak self] (cValue) in
            if let self = self {
                var aValue = aWeak?.value;
                var bValue = bWeak?.value;
                if let aValue = aValue, let bValue = bValue {
                    self.value = calculation(aValue, bValue, cValue)
                }
                
            }
        })
        return self
    }
    func calculatedBy<A, B, C>(
        _ a: ObservableProperty<A>,
        _ b: ObservableProperty<B>,
        _ c: ObservableProperty<C>,
        _ calculation: @escaping (A, B, C) -> T
    ) -> ObservableProperty<T> { return calculatedBy(a: a, b: b, c: c, calculation: calculation) }
    
    func calculatedBy<A, B, C, D>(
        a: ObservableProperty<A>,
        b: ObservableProperty<B>,
        c: ObservableProperty<C>,
        d: ObservableProperty<D>,
        calculation: @escaping (A, B, C, D) -> T
    ) -> ObservableProperty<T> {
        self.value = calculation(a.value, b.value, c.value, d.value)
        weak var aWeak = a
        weak var bWeak = b
        weak var cWeak = c
        weak var dWeak = d
        a.onChange.add(listener : { [weak self] (aValue) in
            if let self = self {
                var bValue = bWeak?.value;
                var cValue = cWeak?.value;
                var dValue = dWeak?.value;
                if let bValue = bValue, let cValue = cValue, let dValue = dValue {
                    self.value = calculation(aValue, bValue, cValue, dValue)
                }
                
            }
        })
        b.onChange.add(listener : { [weak self] (bValue) in
            if let self = self {
                var aValue = aWeak?.value;
                var cValue = cWeak?.value;
                var dValue = dWeak?.value;
                if let aValue = aValue, let cValue = cValue, let dValue = dValue {
                    self.value = calculation(aValue, bValue, cValue, dValue)
                }
                
            }
        })
        c.onChange.add(listener : { [weak self] (cValue) in
            if let self = self {
                var aValue = aWeak?.value;
                var bValue = bWeak?.value;
                var dValue = dWeak?.value;
                if let aValue = aValue, let bValue = bValue, let dValue = dValue {
                    self.value = calculation(aValue, bValue, cValue, dValue)
                }
                
            }
        })
        d.onChange.add(listener : { [weak self] (dValue) in
            if let self = self {
                var aValue = aWeak?.value;
                var bValue = bWeak?.value;
                var cValue = cWeak?.value;
                if let aValue = aValue, let bValue = bValue, let cValue = cValue {
                    self.value = calculation(aValue, bValue, cValue, dValue)
                }
                
            }
        })
        return self
    }
    func calculatedBy<A, B, C, D>(
        _ a: ObservableProperty<A>,
        _ b: ObservableProperty<B>,
        _ c: ObservableProperty<C>,
        _ d: ObservableProperty<D>,
        _ calculation: @escaping (A, B, C, D) -> T
    ) -> ObservableProperty<T> { return calculatedBy(a: a, b: b, c: c, d: d, calculation: calculation) }
}
