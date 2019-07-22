//
//  Main.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


class MainView : ViewDataView<MainViewData> {
    
    var xml: MainXml!
    
    override func commonInit() {
        super.commonInit()
        
        xml = MainXml()
        //Set up your view here.
        xml.boundViewMainContent.bindStack(xmlView: xml, stack: data.stack)
        xml.boundViewMainBack.bindBackButton(stack: data.stack)
        self.addSubview(xml)
        
    }
    
    override func layoutSubviews() {
        xml.pin.top(UIApplication.shared.statusBarFrame.size.height).left().right().bottom()
    }
}

