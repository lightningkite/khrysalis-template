//
//  Kotlin.swift
//  PennyProfit
//
//  Created by Joseph Ivie on 12/12/18.
//  Adapted from Kotlift by Moshbit
//

import Foundation

func TODO(_ message: String = ""){
    //Throw execption
    fatalError(message)
}

extension Array {
    func isEmpty() -> Bool {
        return self.isEmpty
    }
    var size: Int { return self.count }
    mutating func add(_ element: Element) {
        self.append(element)
    }
    mutating func add(_ index: Int, _ element: Element) {
        self.insert(element, at: index)
    }
    mutating func addAll(_ other: Array) {
        for element in other {
            self.append(element)
        }
    }
    func get(_ index: Int) -> Element {
        return self[index]
    }
    mutating func clear() {
        self.removeAll()
    }
    mutating func removeAt(_ index: Int) {
        remove(at: index)
    }
    var lastIndex: Int { return self.count - 1 }
    
    func first() -> Element {
        return first!
    }
    func last() -> Element {
        return last!
    }
    func firstOrNull() -> Element? {
        return first
    }
    func lastOrNull() -> Element? {
        return last
    }
}

extension Array where Element: Equatable {
    mutating func remove(_ element: Element) {
        let index = self.firstIndex(where: { sub in
            sub == element
        })
        if let index = index {
            remove(at: index)
        }
    }
    func indexOf(_ element: Element) -> Int {
        return self.firstIndex(where: { sub in
            sub == element
        }) ?? -1
    }
    static func -(first: Array<Element>, second: Element) -> Array<Element> {
        var copy = first
        copy.remove(second)
        return copy
    }
}

extension Array {
    func find(_ predicate: (Element) -> Bool) -> Element? {
        return first(where: predicate)
    }
    static func +(first: Array<Element>, second: Element) -> Array<Element> {
        return first + [second]
    }
    func sortedBy<T: Comparable>(get: (Element) -> T) -> Array<Element> {
        return self.sorted(by: { get($0) < get($1) })
    }
    func sortedByDescending<T: Comparable>(get: (Element) -> T) -> Array<Element> {
        return self.sorted(by: { get($0) > get($1) })
    }
}

extension Array where Element == String {
    func joinToString(_ between: String = ", ") -> String {
        return self.joined(separator: between)
    }
}

extension Dictionary {
    var size: Int { return self.count }
    mutating func put(_ key: Key, _ value: Value) {
        self[key] = value
    }
    mutating func putAll(_ other: Dictionary) {
        for (key, value) in other {
            self.updateValue(value, forKey: key)
        }
    }
    func isEmpty() -> Bool {
        return self.isEmpty
    }
    mutating func clear() {
        self.removeAll()
    }
}

extension Set {
    var size: Int { return self.count }
    mutating func add(_ element: Element) {
        self.insert(element)
    }
    mutating func addAll(_ other: Set) {
        for element in other {
            self.insert(element)
        }
    }
    func isEmpty() -> Bool {
        return self.isEmpty
    }
    mutating func clear() {
        self.removeAll()
    }
}

extension String {
    var length: Int { return count }
    
    func substring(_ startIndex: Int, _ endIndex: Int? = nil) -> String {
        let s = self.index(self.startIndex, offsetBy: startIndex)
        let e = self.index(self.startIndex, offsetBy: endIndex ?? self.length)
        return String(self[s..<e])
    }
    func substring(_ startIndex: Int) -> String {
        return substring(startIndex, self.length)
    }
    func contains(_ string: String) -> Bool {
        return self.range(of: string) != nil
    }
    func replace(_ target: String, _ withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    func isEmpty() -> Bool {
        return isEmpty
    }
    
    func isBlank() -> Bool {
        return isEmpty || self.allSatisfy { c in c == " " || c == "\n" }
    }
    
    func trimIndent() -> String {
        return self
    }
    
    func toLowerCase() -> String {
        return self.lowercased()
    }
    
    func toUpperCase() -> String {
        return self.uppercased()
    }
    
    func startsWith(_ string: String) -> Bool {
        return starts(with: string)
    }
    
    func endsWith(_ string: String) -> Bool {
        let substring = self.substring(self.length - string.length)
        return substring == string
    }
    
    func removePrefix(_ string: String) -> String {
        if startsWith(string) {
            return substring(string.length)
        } else {
            return self
        }
    }
    
    func removeSuffix(_ string: String) -> String {
        if endsWith(string) {
            return substring(0, self.length - string.length)
        } else {
            return self
        }
    }
    
    func substringBefore(_ string: String, _ defaultTo: String? = nil) -> String {
        let index = self.indexOf(string)
        if index != -1 {
            return substring(index)
        } else {
            return defaultTo ?? self
        }
    }
    
    func substringAfter(_ string: String, _ defaultTo: String? = nil) -> String {
        let index = self.indexOf(string)
        if index != -1 {
            return substring(index + string.length)
        } else {
            return defaultTo ?? self
        }
    }
}


extension StringProtocol {
    func indexOf(_ string: Self, _ startIndex: Int = 0, _ ignoreCase: Bool = true) -> Int {
        var options: String.CompareOptions = .literal
        if ignoreCase {
            options = .caseInsensitive
        }
        if let index = range(of: string, options: options)?.lowerBound {
            return distance(from: self.startIndex, to: index)
        } else {
            return -1
        }
        
    }
}


protocol _StringType { }
extension String: _StringType { }
extension Array where Element: _StringType {
    func joinToString(_ separator: String = "") -> String {
        var retval = ""
        var first = true
        for rawObject in self {
            let element = rawObject as! String
            if (first) {
                retval += element
            } else {
                retval += separator + element
            }
            first = false
        }
        return retval
    }
}

extension CustomStringConvertible {
    func toString() -> String {
        return String(describing: self)
    }
}

extension NSObject {
    func toString() -> String {
        return String(describing: self)
    }
}

extension FixedWidthInteger {
    func toString() -> String {
        return String(describing: self)
    }
}

extension Float {
    func toString() -> String {
        return String(describing: self)
    }
}

extension String {
    func toString() -> String {
        return String(describing: self)
    }
}

class System {
    static func currentTimeMillis() -> Int64 {
        return (Int64) (NSDate().timeIntervalSince1970 * 1000.0)
    }
}

func / (lhs: Double, rhs: Int) -> Double {
    return Double(lhs) / Double(rhs)
}

func / (lhs: Int, rhs: Double) -> Double {
    return Double(lhs) / Double(rhs)
}

protocol Addable {}
extension Int: Addable {}
extension Double: Addable {}


func + (a: Int, b: Double) -> Double {
    return Double(a) + b
}
func + (a: Double, b: Int) -> Double {
    return Double(b) + a
}

func + (a: Int64, b: Double) -> Double {
    return Double(a) + b
}
func + (a: Double, b: Int64) -> Double {
    return Double(b) + a
}

func + (a: Int32, b: Double) -> Double {
    return Double(a) + b
}
func + (a: Double, b: Int32) -> Double {
    return Double(b) + a
}

func + (a: Int16, b: Double) -> Double {
    return Double(a) + b
}
func + (a: Double, b: Int16) -> Double {
    return Double(b) + a
}

func + (a: Int8, b: Double) -> Double {
    return Double(a) + b
}
func + (a: Double, b: Int8) -> Double {
    return Double(b) + a
}

func == (a: Int32, b: Int) -> Bool {
    return Int(a) == b
}
func == (a: Int, b: Int32) -> Bool {
    return Int(b) == a
}

func == (a: Int32, b: Int64) -> Bool {
    return Int64(a) == b
}
func == (a: Int64, b: Int32) -> Bool {
    return Int64(b) == a
}

func == (a: Int, b: Int64) -> Bool {
    return Int64(a) == b
}
func == (a: Int64, b: Int) -> Bool {
    return Int64(b) == a
}

func != (a: Int32, b: Int) -> Bool {
    return Int(a) != b
}
func != (a: Int, b: Int32) -> Bool {
    return Int(b) != a
}

func != (a: Int32, b: Int64) -> Bool {
    return Int64(a) != b
}
func != (a: Int64, b: Int32) -> Bool {
    return Int64(b) != a
}

func != (a: Int, b: Int64) -> Bool {
    return Int64(a) != b
}
func != (a: Int64, b: Int) -> Bool {
    return Int64(b) != a
}

extension Int {
    func toLong() -> Int64 {
        return Int64(self)
    }
}

enum KotlinStyleError : Error {
    case Exception(message: String)
    case IllegalStateException(message: String)
    case IllegalArgumentException(message: String)
}

func Exception(_ message: String) -> KotlinStyleError {
    return KotlinStyleError.Exception(message: message)
}

func IllegalStateException(_ message: String) -> KotlinStyleError {
    return KotlinStyleError.IllegalStateException(message: message)
}

func IllegalArgumentException(_ message: String) -> KotlinStyleError {
    return KotlinStyleError.IllegalArgumentException(message: message)
}