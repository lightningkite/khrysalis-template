//Package: com.lightningkite.kwift.observables.shared
//Converted using Kwift2

import Foundation



public class TransformedObservableProperty<A, B>: ObservableProperty<B> {
    
    public var basedOn: ObservableProperty<A>
    public var transformation:  (A) -> B
    
    override public var value: B {
        get {
            return transformation(basedOn.value)
        }
    }
    override public var onChange: Event<B> { get { return _onChange } set(value) { _onChange = value } }
    
    public init(basedOn: ObservableProperty<A>, transformation: @escaping (A) -> B) {
        self.basedOn = basedOn
        self.transformation = transformation
        self._onChange = basedOn.onChange.transformed(transformation: transformation)
        super.init()
    }
    convenience public init(_ basedOn: ObservableProperty<A>, _ transformation: @escaping (A) -> B) {
        self.init(basedOn: basedOn, transformation: transformation)
    }
    private var _onChange: Event<B>
}
 
 

extension ObservableProperty {
    public func transformed<B>(transformation: @escaping (T) -> B) -> ObservableProperty<B> {
        return TransformedObservableProperty<T, B>(self, transformation)
    }
}
 
