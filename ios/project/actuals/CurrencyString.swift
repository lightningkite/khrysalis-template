//
//  CurrencyString.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 5/13/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation

public enum CurrencyString {
    static private func metricString(amount: Double) -> String {
        switch(abs(amount)) {
        case 0.0 ..< 1_000.0:
            return String(format: "%.1f", amount)
            
        case 1_000.0 ..< 100_000.0:
            return String(format: "%.1fk", amount / 1_000.0)
        case 100_000.0 ..< 1_000_000.0:
            return String(format: "%fk", amount / 1_000.0)
            
        case 1_000_000.0 ..< 100_000_000.0:
            return String(format: "%.1fm", amount / 1_000_000.0)
        case 100_000_000.0 ..< 1_000_000_000.0:
            return String(format: "%fm", amount / 1_000_000.0)
            
        case 1_000_000_000.0 ..< 100_000_000_000.0:
            return String(format: "%.1fb", amount / 1_000_000_000.0)
        case 100_000_000_000.0 ..< 1_000_000_000_000.0:
            return String(format: "%fb", amount / 1_000_000_000.0)
        default:
            return amount.toString()
        }
    }
    
    static func formatShort(amount: Double, currency: String) -> String {
        switch(currency) {
        case "USD":
            return "$" + metricString(amount: amount)
        default:
            return metricString(amount: amount)
        }
    }
}
