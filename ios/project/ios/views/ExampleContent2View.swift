//
//  Main.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


class ExampleContent2View : ViewDataView<ExampleContent2ViewData> {
    
    var xml: ExampleContent2Xml!
    
    override func commonInit() {
        super.commonInit()
        
        xml = ExampleContent2Xml()
        //Set up your view here.
        
        self.addSubview(xml)
        
    }
    
    override func layoutSubviews() {
        xml.pin.top().left().right().bottom()
    }
}

