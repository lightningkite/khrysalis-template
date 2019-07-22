import Foundation
//package com.lightningkite.kwift.shared


//import com.lightningkite.kwift.actuals.StringReference

public final class FormattedStringReference: Equatable, Hashable {
    
    public var reference: StringReference
    public var arguments: [String]
    
    init( reference: StringReference, arguments: [String] ) {
        self.reference = reference
        self.arguments = arguments
    }
    convenience init(
        _ reference: StringReference,
        _ arguments: [String]
    ){ 
        self.init(
            reference: reference,
            arguments: arguments
        ) 
    }
    
    public static func == (lhs: FormattedStringReference, rhs: FormattedStringReference) -> Bool {
        return 
        lhs.reference == rhs.reference && 
        lhs.arguments == rhs.arguments
    }
    
    
    public var hashValue: Int {
        return 
        reference.hashValue ^ 
        arguments.hashValue
    }
    
    
    public func copy(
        reference: (StringReference)? = nil,
        arguments: ([String])? = nil
    ) -> FormattedStringReference {
        return FormattedStringReference(
            reference: reference ?? self.reference,
            arguments: arguments ?? self.arguments
        )
    }
    
    
}
