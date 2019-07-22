//
//  ViewDataViewRegistry.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/18/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation

//let ViewDataViewRegistry: Dictionary<String, DataViewControllerAny.Type> = []
private let viewDataClasses: [ViewDataViewAny.Type] = [
    MainView.self,
    ExampleContentView.self,
    ExampleContent2View.self
]
let ViewDataViewRegistry: Dictionary<String, ViewDataViewAny.Type> = Dictionary(
    uniqueKeysWithValues: viewDataClasses.map { (c) in
        (String(describing: c.dataType!), c)
    }
)

enum ViewDataStackManagementError: Error {
    case unknownType(type: String)
}

extension ViewData {
    func viewController() -> ViewDataViewAny {
        guard let makeType = ViewDataViewRegistry[String(describing: type(of: self))] else {
            fatalError(String(describing: type(of: self)) + " is not registered with any view.")
        }
        return makeType.init(untypedData: self)
    }

}
