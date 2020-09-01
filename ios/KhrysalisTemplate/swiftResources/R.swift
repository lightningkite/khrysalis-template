//
// R.swift
// Created by Khrysalis
//

import Foundation
import UIKit
import Khrysalis


public enum R {
    public enum drawable {}
    public enum string {
        static let empty = NSLocalizedString("", comment: "empty")
        static let app_name = NSLocalizedString("Khrysalis Template", comment: "app_name")
        static let back = NSLocalizedString("Back", comment: "back")
        static let ok = NSLocalizedString("OK", comment: "ok")
        static let cancel = NSLocalizedString("Cancel", comment: "cancel")
        static let welcome_to_switch_town = NSLocalizedString("Welcome to Switch Town!", comment: "welcome_to_switch_town")
        static let i_m_a_switch = NSLocalizedString("I'm a switch!", comment: "i_m_a_switch")
        static let go_to_another_screen = NSLocalizedString("Go to Another Screen", comment: "go_to_another_screen")
        static let you_made_it_to_another_screen = NSLocalizedString("You made it to another screen!", comment: "you_made_it_to_another_screen")
        static let welcome = NSLocalizedString("Welcome!", comment: "welcome")
        static let welcome_message = NSLocalizedString("This is the template for a Khrysalis project. This screen exists to help you figure out stuff about it.", comment: "welcome_message")
        static let increment_the_number = NSLocalizedString("Increment the Number", comment: "increment_the_number")
        static let text_field = NSLocalizedString("Text Field", comment: "text_field")
        static let select_demo = NSLocalizedString("Select Demo", comment: "select_demo")
        static let username = NSLocalizedString("Username", comment: "username")
        static let password = NSLocalizedString("Password", comment: "password")
        static let i_agree = NSLocalizedString("I Agree to the Terms of Service", comment: "i_agree")
        static let submit = NSLocalizedString("Submit", comment: "submit")
        static let mustAgree = NSLocalizedString("You must agree to the terms of service.", comment: "mustAgree")
        static let verify_password = NSLocalizedString("Verify Password", comment: "verify_password")
        static let gallery = NSLocalizedString("Gallery", comment: "gallery")
        static let camera = NSLocalizedString("Camera", comment: "camera")
        static let get_location = NSLocalizedString("Get Location", comment: "get_location")
        static let check_out_my_multiple_rows = NSLocalizedString("Check out my multiple rows", comment: "check_out_my_multiple_rows")
        static let lorem_ipsum = NSLocalizedString("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ", comment: "lorem_ipsum")
        static let lorem_pixel = NSLocalizedString("Lorem Pixel", comment: "lorem_pixel")
        static let connect = NSLocalizedString("Connect", comment: "connect")
        static let this_data_is_loaded_from_json_placeholder_typicode = NSLocalizedString("This data is loaded from JSON Placeholder Typicode. ", comment: "this_data_is_loaded_from_json_placeholder_typicode")
        static let play_video = NSLocalizedString("Play video", comment: "play_video")
        static let gallery_multi = NSLocalizedString("Gallery Multiple", comment: "gallery_multi")
        static let camera_multi = NSLocalizedString("Camera Multiple", comment: "camera_multi")
    }
    public enum dimen {
    }
    public enum color {
        static let transparent = UIColor.clear
        static let black = UIColor.black
        static let white = UIColor.white
        static let colorPrimary: UIColor = UIColor(argb: 0xFF10769c)
        static let colorPrimaryDark: UIColor = UIColor(argb: 0xFF0e6484)
        static let colorPrimaryDarker: UIColor = UIColor(argb: 0xFF0a465c)
        static let colorAccent: UIColor = UIColor(argb: 0xFFf5952e)
        static let colorAccentDark: UIColor = UIColor(argb: 0xFFae6a21)
        static let disabled: UIColor = UIColor(argb: 0xFFADADAD)
        static let calendar_selected_day_bg: UIColor = UIColor(argb: 0xFFFF0000)
        static let calendar_selected_range_bg: UIColor = UIColor(argb: 0xFFFF0000)
        static let calendar_unavailable_bg: UIColor = UIColor(argb: 0xFFFFFF00)
        static let calendar_range_middle_unavailable_bg: UIColor = UIColor(argb: 0xFFFFFF00)
        static let calendar_range_middle_deactivated_bg: UIColor = UIColor(argb: 0xFFCCCCCC)
        static func state_primary(_ state: UIControl.State) -> UIColor {
            if state.contains(.disabled) {
                return R.color.disabled
            }
            return R.color.colorPrimary
            return UIColor.white
        }
        static func state_accent(_ state: UIControl.State) -> UIColor {
            if state.contains(.disabled) {
                return R.color.disabled
            }
            return R.color.colorAccent
            return UIColor.white
        }
        static func state_login_text(_ state: UIControl.State) -> UIColor {
            if state.contains(.disabled) {
                return R.color.disabled
            }
            return R.color.colorPrimary
            return UIColor.white
        }
        static func state_accent_toggle(_ state: UIControl.State) -> UIColor {
            if state.contains(.disabled) {
                return R.color.disabled
            }
            if state.contains(.selected) {
                return R.color.colorAccent
            }
            if state.contains(.selected) {
                return R.color.colorAccent
            }
            return R.color.disabled
            return UIColor.white
        }
    }
}
