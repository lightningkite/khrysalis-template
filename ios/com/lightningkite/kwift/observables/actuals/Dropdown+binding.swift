//
//  Dropdown+binding.swift
//  KwiftTemplate
//
//  Created by Joseph Ivie on 8/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


extension Dropdown {
    func bind<T: Equatable, VIEW: UIView>(
        data: ObservableProperty<[T]>,
        selected: MutableObservableProperty<T>,
        makeLayout: @escaping () -> VIEW,
        setup: @escaping (VIEW, T) -> Void
    ) {
        let boundDataSource = PickerBoundDataSource(data: data, selected: selected, createView: makeLayout, updateView: setup)
        self.dataSource = boundDataSource
        self.delegate = boundDataSource
        retain(as: "boundDataSource", item: boundDataSource)
        
        data.addAndRunWeak(self) { this, value in
            this.pickerView.reloadAllComponents()
        }
        self.selectedView = makeLayout()
        selected.addAndRunWeak(self) { this, value in
            setup(this.selectedView as! VIEW, value)
            var index = data.value.indexOf(value)
            if index == -1 {
                index = 0
            }
            this.pickerView.selectRow(index, inComponent: 0, animated: false)
        }
    }
}


class PickerBoundDataSource<T, VIEW: UIView>: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    weak var data: ObservableProperty<[T]>?
    weak var selected: MutableObservableProperty<T>?
    let createView: () -> VIEW
    let updateView: (VIEW, T) -> Void
    
    init(data: ObservableProperty<[T]>, selected: MutableObservableProperty<T>, createView: @escaping () -> VIEW, updateView: @escaping (VIEW, T) -> Void) {
        self.data = data
        self.selected = selected
        self.createView = createView
        self.updateView = updateView
        super.init()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let options = data?.value
        return options?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let v = view ?? createView()
        guard let value = data?.value[row] else {
            return v
        }
        updateView(v as! VIEW, value)
        return v
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let selected = selected, let data = data {
            selected.value = data.value[row]
        }
    }
    
}
