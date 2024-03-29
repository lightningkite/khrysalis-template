//
//  AppDelegate.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 2/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import UIKit
import LKButterfly

@UIApplicationMain
class AppDelegate: ButterflyAppDelegate {
    override func makeMain() -> ViewGenerator {
        return MainVG()
    }
    
    override func makeViewController() -> ButterflyViewController {
        let vc = super.makeViewController()
        vc.forceDefaultBackgroundColor = true
        vc.drawOverSystemWindows = true
        return vc
    }
    
    override open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
