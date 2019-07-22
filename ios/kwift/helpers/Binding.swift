//
//  Binding.swift
//  PennyProfit
//
//  Created by Joseph Ivie on 1/2/19.
//  Copyright © 2019 Shane Thompson. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

extension UIView {
    func bindVisible(observable: ObservableProperty<Bool>) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if value {
                this.flex.display(.flex)
            } else {
                this.flex.display(.none)
            }
            this.relayoutFlexClimbToXml()
        }
    }

    func relayoutFlexClimbToXml() {
        if self is XmlView {
            self.flex.layout()
        } else {
            self.superview?.relayoutFlexClimbToXml()
        }
    }
}

extension UILabel {
    func bind(observable: ObservableProperty<String>) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if this.text != value {
                this.text = value
            }
            this.flex.markDirty()
            this.relayoutFlexClimbToXml()
        }
    }

    func bind<T>(observable: ObservableProperty<T>, transform: @escaping (T) -> String) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            let textValue = transform(value)
            if this.text != textValue {
                this.text = textValue
            }
            this.flex.markDirty()
            this.relayoutFlexClimbToXml()
        }
    }

    func bind(observableReference: ObservableProperty<StringReference?>) {
        observableReference.addAndRunWeak(referenceA: self) { (this, value) in
            if let value = value {
                let localValue = NSLocalizedString(value, comment: "")
                if this.text != localValue {
                    this.text = localValue
                }
            } else {
                this.text = nil
            }
            this.flex.markDirty()
            this.relayoutFlexClimbToXml()
        }
    }
}

extension UITextField {

    func bind(observable: ObservableProperty<String>) {
        delegate = DoneDelegate.shared
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if this.text != value {
                this.text = value
            }
            this.flex.markDirty()
        }
        weak var observableWeak = observable
        addAction(for: UITextField.Event.editingChanged) { [weak self] in
            if observableWeak?.value != self?.text {
                observableWeak?.value = self?.text ?? ""
            }
        }
    }

    func bindNumber(observable: ObservableProperty<Double>) {
        delegate = DoneDelegate.shared
        if observable.value != 0.0 {
            text = observable.value.toString()
        }
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            let currentValue = Double(this.text ?? "")
            if currentValue != nil, currentValue != value {
                this.text = value.toString()
                this.flex.markDirty()
            }
        }
        weak var observableWeak = observable
        addAction(for: UITextField.Event.editingChanged) { [weak self] in
            if let self = self, let currentValue = Double(self.text ?? ""), observableWeak?.value != currentValue {
                observableWeak?.value = currentValue
            }
        }
    }

    func bindNumber(observable: ObservableProperty<Int>) {
        delegate = DoneDelegate.shared
        if observable.value != 0 {
            text = observable.value.toString()
        }
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            let currentValue = Int(this.text ?? "")
            if currentValue != nil, currentValue != value {
                this.text = value.toString()
                this.flex.markDirty()
            }
        }
        weak var observableWeak = observable
        addAction(for: UITextField.Event.editingChanged) { [weak self] in
            if let self = self, let currentValue = Int(self.text ?? ""), observableWeak?.value != currentValue {
                observableWeak?.value = currentValue
            }
        }
    }
}

extension UITextView {

    class LambdaDelegate: NSObject, UITextViewDelegate {
        let action: (String) -> Void

        init(action: @escaping (String) -> Void) {
            self.action = action
            super.init()
        }

        func textViewDidChange(_ textView: UITextView) {
            action(textView.text)
        }
    }

    func bindEditable(observable: ObservableProperty<String>) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if this.text != value {
                this.text = value
            }
            this.flex.markDirty()
        }
        weak var observableWeak = observable
        let delegate = LambdaDelegate { text in
            if observableWeak?.value != text {
                observableWeak?.value = text
            }
        }
        retain(as: "kwift_dg", item: delegate)
        self.delegate = delegate
    }

    func bind(observable: ObservableProperty<String>) {
        isEditable = false
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if this.text != value {
                this.text = value
            }
            this.flex.markDirty()
            this.relayoutFlexClimbToXml()
        }
    }

    func bind(observableReference: ObservableProperty<StringReference?>) {
        isEditable = false
        observableReference.addAndRunWeak(referenceA: self) { (this, value) in
            if let value = value {
                let localValue = NSLocalizedString(value, comment: "")
                if this.text != localValue {
                    this.text = localValue
                }
            } else {
                this.text = nil
            }
            this.flex.markDirty()
            this.relayoutFlexClimbToXml()
        }
    }
}

extension UISwitch {
    func bind(observable: ObservableProperty<Bool>) {
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

    func bind<T: Equatable>(myValue: T, selected: ObservableProperty<T>) {
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

extension Dropdown {
    func bindSelect<T: Equatable, VIEW: UIView>(data: ObservableProperty<[T]>, selected: ObservableProperty<T>, createView: @escaping () -> VIEW, updateView: @escaping (VIEW, T) -> Void) {
        let boundDataSource = PickerBoundDataSource(data: data, selected: selected, createView: createView, updateView: updateView)
        self.dataSource = boundDataSource
        self.delegate = boundDataSource
        retain(as: "boundDataSource", item: boundDataSource)

        data.addAndRunWeak(self) { this, value in
            this.pickerView.reloadAllComponents()
        }
        self.selectedView = createView()
        selected.addAndRunWeak(self) { this, value in
            updateView(this.selectedView as! VIEW, value)
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
    weak var selected: ObservableProperty<T>?
    let createView: () -> VIEW
    let updateView: (VIEW, T) -> Void

    init(data: ObservableProperty<[T]>, selected: ObservableProperty<T>, createView: @escaping () -> VIEW, updateView: @escaping (VIEW, T) -> Void) {
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

extension UITableView {
    func bindSwipeRefresh(loading: ObservableProperty<Bool>, onRefresh: @escaping () -> Void) {
        let control = UIRefreshControl()
        control.addAction(for: .valueChanged, action: onRefresh)
        if #available(iOS 10.0, *) {
            refreshControl = control
        } else {
            addSubview(control)
        }
        loading.addAndRunWeak(referenceA: control) { (this, value) in
            if value {
                this.beginRefreshing()
            } else {
                this.endRefreshing()
            }
        }
    }

    func bind<T, VIEW: UIView>(
            data: ObservableProperty<[T]>,
            atEnd: @escaping () -> Void = {
            },
            spacing: CGFloat = 8,
            getView: @escaping () -> VIEW,
            updateCell: @escaping (VIEW, T) -> Void
    ) {
        let boundDataSource = BoundDataSource(source: data, atEnd: atEnd, spacing: spacing, getView: getView, updateCell: updateCell)
        dataSource = boundDataSource
        delegate = boundDataSource
        retain(as: "boundDataSource", item: boundDataSource)

        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension

        var previouslyEmpty = data.value.isEmpty
        data.addAndRunWeak(self, data) { this, data, value in
            let emptyNow = data.value.isEmpty
            this.reloadData()
            if previouslyEmpty && !emptyNow {
                this.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
            }
            previouslyEmpty = emptyNow
        }
    }
}

class CustomUITableViewCell: UITableViewCell {
    var spacing: CGFloat = 0
    var subview: UIView = UIView(frame: CGRect.zero) {
        didSet {
            subview.removeFromSuperview()
            centerSubview()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        centerSubview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func centerSubview() {
        contentView.flex.direction(.column).alignItems(.stretch).alignContent(.stretch).padding(spacing).addItem(subview)
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }

    fileprivate func layout() {
//        subview.flex.layout(mode: .adjustHeight)
        contentView.flex.layout(mode: .adjustHeight)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // 1) Set the contentView's width to the specified size parameter
        contentView.pin.width(size.width)
//        subview.pin.width(size.width)

        // 2) Layout contentView flex container
        layout()

        // Return the flex container new size
        return contentView.frame.size
    }
}

class BoundDataSource<T, VIEW: UIView>: NSObject, UITableViewDataSource, UITableViewDelegate {

    weak var source: ObservableProperty<[T]>?
    let getView: () -> VIEW
    let updateCell: (VIEW, T) -> Void
    let atEnd: () -> Void
    let stubView: VIEW
    let spacing: CGFloat

    init(source: ObservableProperty<[T]>, atEnd: @escaping () -> Void, spacing: CGFloat, getView: @escaping () -> VIEW, updateCell: @escaping (VIEW, T) -> Void) {
        self.source = source
        self.getView = getView
        self.atEnd = atEnd
        self.spacing = spacing
        self.updateCell = updateCell
        self.stubView = getView()
        super.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.source?.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row >= (source?.value.count ?? 1) - 1 {
            atEnd()
        }
    }

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        if let s = source?.value {
//            updateCell(stubView, s[indexPath.row])
//            return stubView.flex.sizeThatFits(size: CGSize(width: tableView.frame.width, height: 100000)).height
//        } else {
//            return 50
//        }
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let s = source?.value {
            var cell: CustomUITableViewCell
            cell = CustomUITableViewCell(style: .default, reuseIdentifier: "main-cell")
            cell.spacing = self.spacing
            cell.selectionStyle = .none
            let v = getView()
            cell.subview = v
            if let view: VIEW = cell.subview as? VIEW {
                updateCell(view, s[indexPath.row])
            }
            return cell
        } else {
            print("CELL FAILED")
            let cell = tableView.dequeueReusableCell(withIdentifier: "list-released") ?? UITableViewCell(style: .default, reuseIdentifier: "list-released")
            return cell
        }
    }

}

extension UIImageView {
    func af_setImageProgress(
            withURL url: URL,
            placeholderImage: UIImage? = nil,
            imageTransition: ImageTransition = .noTransition,
            runImageTransitionIfCached: Bool = false,
            completion: ((DataResponse<UIImage>) -> Void)? = nil
    ) {
        let activityIndicatorView = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        activityIndicatorView.setProgress(0, animated: true)
        activityIndicatorView.center.x = self.frame.size.width / 2
        activityIndicatorView.center.y = self.frame.size.height / 2
        self.addSubview(activityIndicatorView)
        weak var weakAIV = activityIndicatorView
        af_setImage(
                withURL: url,
                placeholderImage: placeholderImage,
                progress: { progress -> Void in
                    weakAIV?.setProgress(Float(progress.fractionCompleted), animated: true)
                    return
                },
                imageTransition: imageTransition,
                runImageTransitionIfCached: runImageTransitionIfCached,
                completion: { result in
                    weakAIV?.removeFromSuperview()
                    completion?(result)
                }
        )
    }
}

extension UIButton {
    func bindBackButton(stack: ViewDataStack) {
        stack.changeEvent.addAndRunWeak(self, stack.stack) { this, value in
            this.isHidden = value.count <= 1
        }
        addAction {
            stack.pop()
        }
    }

    func bindToggle<T: Equatable>(value: T, observable: ObservableProperty<T>) {
        observable.addAndRunWeak(self) { (this, current) in
            this.isSelected = (current == value)
            this.flex.markDirty()
        }
        weak var weakObs = observable
        addAction { [weak self] in
            weakObs?.value = value
        }
    }
    
    func bindAction(action: @escaping (@escaping ()->Void)->Void) {
        addAction {
            let startText = self.title(for: .normal)
            self.setTitle(nil, for: .normal)
            let activityIndicatorView = UIActivityIndicatorView()
            activityIndicatorView.startAnimating()
            activityIndicatorView.center.x = self.frame.size.width/2
            activityIndicatorView.center.y = self.frame.size.height/2
            self.addSubview(activityIndicatorView)
            
            weak var weakAIV = activityIndicatorView
            action {
                self.setTitle(startText, for: .normal)
                weakAIV?.stopAnimating()
                weakAIV?.removeFromSuperview()
            }
        }
    }
}

extension UIView {
    func bindStack(xmlView: XmlView, stack: ViewDataStack) {
        var current: ViewDataViewAny? = nil
        var lastCount = 0
        stack.changeEvent.addAndRunWeak(self, stack.stack) { this, value in
            var multiplier: CGFloat = 1
            var oldFrameEnd: (UIView) -> Void
            var newFrameStart: (UIView) -> Void
            if lastCount > value.count {
                oldFrameEnd = {
                    $0.frame = CGRect(x: this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
                newFrameStart = {
                    $0.frame = CGRect(x: -this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
            } else if lastCount < value.count {
                oldFrameEnd = {
                    $0.frame = CGRect(x: -this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
                newFrameStart = {
                    $0.frame = CGRect(x: this.frame.width, y: 0, width: this.frame.width, height: this.frame.height)
                }
            } else {
                oldFrameEnd = {
                    $0.alpha = 0
                }
                newFrameStart = {
                    $0.alpha = 0
                }
            }
            lastCount = value.count

            if let old = current {
                print("Animating out")
                UIView.animate(
                        withDuration: 0.25,
                        animations: {
                            oldFrameEnd(old)
                        },
                        completion: { done in
                            print("Removing")
                            old.removeFromSuperview()
                        }
                )
            }
            if let newData = value.last {
                print("Adding in")
                let new = newData.viewController()
                newFrameStart(new)
                this.addSubview(new)
                UIView.animate(
                        withDuration: 0.25,
                        animations: {
                            print("Finalized")
                            new.frame = CGRect(x: 0, y: 0, width: this.frame.width, height: this.frame.height)
                            new.alpha = 1
                        }
                )
                current = new
            }
        }
        xmlView.onLayoutSubviews.addWeak(self) { this, _ in
            for v in this.subviews {
                v.pin.top().left().right().bottom()
            }
        }
    }
}

//extension UINavigationBar {
//    static var dataTypeToView = [ViewData : DataViewController]
//    func
//}


extension DateButton {
    func bind(observable: ObservableProperty<Date>) {
        observable.addAndRunWeak(referenceA: self) { (this, value) in
            if this.date != value {
                this.date = value
            }
        }
        weak var observableWeak = observable
        picker.addAction(for: .valueChanged) { [weak self] in
            if observableWeak?.value != self?.date {
                observableWeak?.value = self?.date ?? Date()
            }
        }
    }
}
