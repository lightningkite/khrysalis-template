import Foundation
//package com.lightningkite.kwift.shared


//import com.lightningkite.kwift.actuals.AnyObject
//import com.lightningkite.kwift.actuals.escaping
//import com.lightningkite.kwift.actuals.weak

final public class Event<T> {
    
    
    init() {
        self.id = 0
    }
    
    var subscriptions = [Subscription<T>]()
    var id: Int
    
    func addAndRun(value: T, listener: @escaping (T) -> Void) -> Subscription<T> {
        listener(value)
        return add(listener : listener)
    }
    func addAndRun(_ value: T, _ listener: @escaping (T) -> Void) -> Subscription<T> { return addAndRun(value: value, listener: listener) }
    
    func add( listener: @escaping (T) -> Void) -> Subscription<T> {
        var element = Subscription(listener : { (item: T) in
            listener(item);
            return false
        }, identifier : id)
        id += 1
        subscriptions.add(element)
        return element
    }
    
    func addWithRemovalCondition( listener: @escaping (T) -> Bool) -> Subscription<T> {
        var element = Subscription(listener : listener, identifier : id)
        id += 1
        subscriptions.add(element)
        return element
    }
    
    func remove(subscription: Subscription<T>) {
        subscriptions.removeAll { (it) in it.identifier == subscription.identifier }
    }
    func remove(_ subscription: Subscription<T>) { remove(subscription: subscription) }
    
    func invokeAll(value: T) {
        subscriptions.removeAll { (subscription) in
            subscription.listener(value)
        }
    }
    func invokeAll(_ value: T) { invokeAll(value: value) }
    
    
    func addWeak<A : AnyObject>(referenceA: A, listener: @escaping (A, T) -> Void) -> Subscription<T> {
        weak var weakA = referenceA;
        var element = Subscription(
            listener : { (item: T) in
                var a = weakA;
                if let a = a {
                    listener(a, item);
                    return false
                } else {
                    return true
                }
            },
            identifier : id
        )
        id += 1
        subscriptions.add(element)
        return element
    }
    func addWeak<A : AnyObject>(_ referenceA: A, _ listener: @escaping (A, T) -> Void) -> Subscription<T> { return addWeak(referenceA: referenceA, listener: listener) }
    
    func addWeak<A : AnyObject, B : AnyObject>(
        referenceA: A,
        referenceB: B, listener: @escaping (A, B, T) -> Void
    ) -> Subscription<T> {
        weak var weakA = referenceA
        weak var weakB = referenceB
        var element = Subscription(
            listener : { (item: T) in
                var a = weakA;
                var b = weakB;
                if let a = a, let b = b {
                    listener(a, b, item);
                    return false
                } else {
                    return true
                }
            },
            identifier : id
        )
        id += 1
        subscriptions.add(element)
        return element
    }
    func addWeak<A : AnyObject, B : AnyObject>(
        _ referenceA: A,
        _ referenceB: B, _ listener: @escaping (A, B, T) -> Void
    ) -> Subscription<T> { return addWeak(referenceA: referenceA, referenceB: referenceB, listener: listener) }
    
    func addWeak<A : AnyObject, B : AnyObject, C : AnyObject>(
        referenceA: A,
        referenceB: B,
        referenceC: C, listener: @escaping (A, B, C, T) -> Void
    ) -> Subscription<T> {
        weak var weakA = referenceA
        weak var weakB = referenceB
        weak var weakC = referenceC
        var element = Subscription(
            listener : { (item: T) in
                var a = weakA;
                var b = weakB;
                var c = weakC;
                if let a = a, let b = b, let c = c {
                    listener(a, b, c, item);
                    return false
                } else {
                    return true
                }
            },
            identifier : id
        )
        id += 1
        subscriptions.add(element)
        return element
    }
    func addWeak<A : AnyObject, B : AnyObject, C : AnyObject>(
        _ referenceA: A,
        _ referenceB: B,
        _ referenceC: C, _ listener: @escaping (A, B, C, T) -> Void
    ) -> Subscription<T> { return addWeak(referenceA: referenceA, referenceB: referenceB, referenceC: referenceC, listener: listener) }
    
    
    func addAndRunWeak<A : AnyObject>(
        referenceA: A,
        value: T,
        listener: @escaping (A, T) -> Void
    ) -> Subscription<T> {
        listener(referenceA, value)
        weak var weakA = referenceA;
        var element = Subscription(
            listener : { (item: T) in
                var a = weakA;
                if let a = a {
                    listener(a, item);
                    return false
                } else {
                    return true
                }
            },
            identifier : id
        )
        id += 1
        subscriptions.add(element)
        return element
    }
    func addAndRunWeak<A : AnyObject>(
        _ referenceA: A,
        _ value: T,
        _ listener: @escaping (A, T) -> Void
    ) -> Subscription<T> { return addAndRunWeak(referenceA: referenceA, value: value, listener: listener) }
    
    func addAndRunWeak<A : AnyObject, B : AnyObject>(
        referenceA: A,
        referenceB: B,
        value: T,
        listener: @escaping (A, B, T) -> Void
    ) -> Subscription<T> {
        listener(referenceA, referenceB, value)
        weak var weakA = referenceA
        weak var weakB = referenceB
        var element = Subscription(
            listener : { (item: T) in
                var a = weakA;
                var b = weakB;
                if let a = a, let b = b {
                    listener(a, b, item);
                    return false
                } else {
                    return true
                }
            },
            identifier : id
        )
        id += 1
        subscriptions.add(element)
        return element
    }
    func addAndRunWeak<A : AnyObject, B : AnyObject>(
        _ referenceA: A,
        _ referenceB: B,
        _ value: T,
        _ listener: @escaping (A, B, T) -> Void
    ) -> Subscription<T> { return addAndRunWeak(referenceA: referenceA, referenceB: referenceB, value: value, listener: listener) }
    
    func addAndRunWeak<A : AnyObject, B : AnyObject, C : AnyObject>(
        referenceA: A,
        referenceB: B,
        referenceC: C,
        value: T,
        listener: @escaping (A, B, C, T) -> Void
    ) -> Subscription<T> {
        listener(referenceA, referenceB, referenceC, value)
        weak var weakA = referenceA
        weak var weakB = referenceB
        weak var weakC = referenceC
        var element = Subscription(
            listener : { (item: T) in
                var a = weakA;
                var b = weakB;
                var c = weakC;
                if let a = a, let b = b, let c = c {
                    listener(a, b, c, item);
                    return false
                } else {
                    return true
                }
            },
            identifier : id
        )
        id += 1
        subscriptions.add(element)
        return element
    }
    func addAndRunWeak<A : AnyObject, B : AnyObject, C : AnyObject>(
        _ referenceA: A,
        _ referenceB: B,
        _ referenceC: C,
        _ value: T,
        _ listener: @escaping (A, B, C, T) -> Void
    ) -> Subscription<T> { return addAndRunWeak(referenceA: referenceA, referenceB: referenceB, referenceC: referenceC, value: value, listener: listener) }
}
