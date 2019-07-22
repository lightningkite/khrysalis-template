//
//  ResourceLibrarySelect.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


class ResourceLibrarySelectView : ViewDataView<ResourceLibrarySelectViewData> {
    
    var xml: ResourceLibrarySelectXml!
    
    override func commonInit() {
        super.commonInit()
        
        xml = ResourceLibrarySelectXml()
        self.addSubview(xml)
        
        //Set up your view here.
        
    }
    
    override func layoutSubviews() {
        xml.pin.top().left().right().bottom()
    }
}

