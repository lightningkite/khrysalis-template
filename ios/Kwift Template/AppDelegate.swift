//
//  AppDelegate.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 2/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Kwift

@UIApplicationMain
class AppDelegate: KwiftAppDelegate {
    override func makeMain() -> ViewGenerator {
        return MainVG()
    }
    
    override open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
