//
//  ViewController.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 2/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import UIKit
import Kwift

class ViewController: KwiftViewController {
    
    static let myMain = MainVG()
    
    override open var main: ViewGenerator {
        return ViewController.myMain
    }
}
