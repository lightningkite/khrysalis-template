//
// ResourcesColors.swift
// Created by Butterfly
//

import Foundation
import UIKit
import Butterfly


public enum ResourcesColors {
    static let transparent = UIColor.clear
    static let black = UIColor.black
    static let white = UIColor.white
    static let colorPrimary: UIColor = UIColor(argb: 0xFF10769c)
    static let colorPrimaryDark: UIColor = UIColor(argb: 0xFF0e6484)
    static let colorPrimaryDarker: UIColor = UIColor(argb: 0xFF0a465c)
    static let colorAccent: UIColor = UIColor(argb: 0xFFf5952e)
    static let colorAccentDark: UIColor = UIColor(argb: 0xFFae6a21)
    static let disabled: UIColor = UIColor(argb: 0xFFADADAD)
    static let calendarSelectedDayBg: UIColor = UIColor(argb: 0xFFFF0000)
    static let calendarSelectedRangeBg: UIColor = UIColor(argb: 0xFFFF0000)
    static let calendarUnavailableBg: UIColor = UIColor(argb: 0xFFFFFF00)
    static let calendarRangeMiddleUnavailableBg: UIColor = UIColor(argb: 0xFFFFFF00)
    static let calendarRangeMiddleDeactivatedBg: UIColor = UIColor(argb: 0xFFCCCCCC)
    static func statePrimary(_ state: UIControl.State) -> UIColor {
        if state.contains(.disabled) {
            return ResourcesColors.disabled
        }
        return ResourcesColors.colorPrimary
        return UIColor.white
    }
    static func stateAccentToggle(_ state: UIControl.State) -> UIColor {
        if state.contains(.disabled) {
            return ResourcesColors.disabled
        }
        if state.contains(.selected) {
            return ResourcesColors.colorAccent
        }
        if state.contains(.selected) {
            return ResourcesColors.colorAccent
        }
        return ResourcesColors.disabled
        return UIColor.white
    }
    static func stateAccent(_ state: UIControl.State) -> UIColor {
        if state.contains(.disabled) {
            return ResourcesColors.disabled
        }
        return ResourcesColors.colorAccent
        return UIColor.white
    }
    static func stateLoginText(_ state: UIControl.State) -> UIColor {
        if state.contains(.disabled) {
            return ResourcesColors.disabled
        }
        return ResourcesColors.colorPrimary
        return UIColor.white
    }
}
