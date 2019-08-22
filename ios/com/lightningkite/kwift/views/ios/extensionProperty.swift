//
//  extensionProperty.swift
//  KwiftTemplate
//
//  Created by Joseph Ivie on 8/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation

class ExtensionProperty<On: AnyObject, T> {
    
    private class Box<T> {
        var value: T
        init(value: T){
            self.value = value
        }
    }
    private var table = NSMapTable<On, Box<T>>(keyOptions: .weakMemory, valueOptions: .strongMemory)
    func get(_ from: On) -> T? {
        return table.object(forKey: from)?.value
    }
    func set(_ from: On, _ value: T?) {
        if let value = value {
            let box = Box(value: value)
            table.setObject(box, forKey: from)
        } else {
            table.removeObject(forKey: from)
        }
    }
}
