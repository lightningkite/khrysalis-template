//
//  Main.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


class ExampleContentView : ViewDataView<ExampleContentViewData> {
    
    var xml: ExampleContentXml!
    
    override func commonInit() {
        super.commonInit()
        
        xml = ExampleContentXml()
        //Set up your view here.
        xml.boundViewExampleContentNumber.bind(observable: data.number, transform: { $0.toString() })
        xml.boundViewExampleContentIncrement.addAction { [weak self] in self?.data.increment() }
        xml.boundViewExampleContentGoToAnotherScreen.addAction { [weak self] in self?.data.goToAnotherScreen() }
        
        self.addSubview(xml)
        
    }
    
    override func layoutSubviews() {
        xml.pin.top().left().right().bottom()
    }
}

