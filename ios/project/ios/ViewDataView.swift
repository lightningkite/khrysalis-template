//
//  DataViewController.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 2/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


public class ViewDataViewAny : UIView {
    
    class var dataType: ViewData.Type? {
        get {
            return nil
        }
    }
    
    let untypedData: ViewData
    
    required init(untypedData: ViewData) {
        self.untypedData = untypedData
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("asdf")
    }
}


public class ViewDataView<DATA: ViewData>: ViewDataViewAny {
    
    override class var dataType: ViewData.Type?  {
        get {
            return DATA.self
        }
    }
    
    public let data: DATA
    
    init(data: DATA) {
        self.data = data
        super.init(untypedData: data)
        commonInit()
    }
    
    required init(untypedData: ViewData) {
        self.data = untypedData as! DATA
        super.init(untypedData: data)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("asdf")
    }
    
    public func commonInit() {
        
    }
}
