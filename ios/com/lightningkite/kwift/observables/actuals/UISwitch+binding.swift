//
//  UISwitch+binding.swift
//  KwiftTemplate
//
//  Created by Joseph Ivie on 8/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit

extension LabeledSwitch {
    func bind(_ observable: MutableObservableProperty<Bool>){
        return switchView.bind(observable: observable)
    }
    func bind(observable: MutableObservableProperty<Bool>){
        return switchView.bind(observable: observable)
    }
    func bindSelect<T: Equatable>(_ myValue: T, _ selected: MutableObservableProperty<T>){
        return switchView.bindSelect(myValue: myValue, selected: selected)
    }
    func bindSelect<T: Equatable>(myValue: T, selected: MutableObservableProperty<T>){
        return switchView.bindSelect(myValue: myValue, selected: selected)
    }
}

extension LabeledCheckbox {
    func bind(_ observable: MutableObservableProperty<Bool>){
        return bind(observable: observable)
    }
    func bind(observable: MutableObservableProperty<Bool>){
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if this.isOn != value {
                this.isOn = value
            }
        }
        weak var observableWeak = observable
        self.onCheckChanged = { [weak self] value in
            if observableWeak?.value != self?.isOn {
                observableWeak?.value = self?.isOn ?? false
            }
        }
    }
    func bindSelect<T: Equatable>(_ myValue: T, _ selected: MutableObservableProperty<T>){
        return bindSelect(myValue: myValue, selected: selected)
    }
    func bindSelect<T: Equatable>(myValue: T, selected: MutableObservableProperty<T>){
        selected.addAndRunWeak(referenceA: self) { (this, value) in
            let shouldBeOn = value == myValue
            if this.isOn != shouldBeOn {
                this.isOn = shouldBeOn
            }
        }
        weak var observableWeak = selected
        self.onCheckChanged = { [weak self] value in
            if let observable = observableWeak {
                if value && observable.value != myValue {
                    observable.value = myValue
                }
            }
        }
    }
}

extension UISwitch {
    func bind(_ observable: MutableObservableProperty<Bool>){
        return bind(observable: observable)
    }
    func bind(observable: MutableObservableProperty<Bool>) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if this.isOn != value {
                this.isOn = value
            }
        }
        weak var observableWeak = observable
        addAction(for: UITextField.Event.valueChanged) { [weak self] in
            if observableWeak?.value != self?.isOn {
                observableWeak?.value = self?.isOn ?? false
            }
        }
    }
    
    func bindSelect<T: Equatable>(_ myValue: T, _ selected: MutableObservableProperty<T>){
        return bindSelect(myValue: myValue, selected: selected)
    }
    func bindSelect<T: Equatable>(myValue: T, selected: MutableObservableProperty<T>) {
        selected.addAndRunWeak(referenceA: self) { (this, value) in
            let selected = value == myValue
            if this.isOn != selected {
                this.isOn = selected
            }
        }
        weak var observableWeak = selected
        addAction(for: UITextField.Event.valueChanged) { [weak self] in
            let s = observableWeak?.value
            if self?.isOn == true, let s = s, s != myValue {
                observableWeak?.value = myValue
            }
            if self?.isOn == false, let s = s, s == myValue {
                self?.isOn = true
            }
        }
    }
}
