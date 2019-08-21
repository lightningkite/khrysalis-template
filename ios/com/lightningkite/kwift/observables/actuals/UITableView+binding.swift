//
//  UITableView+binding.swift
//  KwiftTemplate
//
//  Created by Joseph Ivie on 8/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    func bindRefresh(_ loading: ObservableProperty<Bool>, _ onRefresh: @escaping () -> Void) {
        return bindRefresh(loading: loading, onRefresh: onRefresh)
    }
    func bindRefresh(loading: ObservableProperty<Bool>, onRefresh: @escaping () -> Void) {
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
    
    func whenScrolledToEnd(action: @escaping ()->Void) {
        if let delegate = delegate as? HasAtEnd {
            delegate.setAtEnd(action: action)
        }
    }
    
    func bind<T, VIEW: UIView>(
        data: ObservableProperty<[T]>,
        spacing: CGFloat = 8,
        makeLayout: @escaping () -> VIEW,
        setup: @escaping (VIEW, T) -> Void
    ) {
        let boundDataSource = BoundDataSource(source: data, spacing: spacing, getView: makeLayout, updateCell: setup)
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

protocol HasAtEnd {
    var atEnd: () -> Void { get set }
    func setAtEnd(action: @escaping () -> Void)
}

class BoundDataSource<T, VIEW: UIView>: NSObject, UITableViewDataSource, UITableViewDelegate, HasAtEnd {
    
    weak var source: ObservableProperty<[T]>?
    let getView: () -> VIEW
    let updateCell: (VIEW, T) -> Void
    var atEnd: () -> Void = {}
    let stubView: VIEW
    let spacing: CGFloat
    
    init(source: ObservableProperty<[T]>, spacing: CGFloat, getView: @escaping () -> VIEW, updateCell: @escaping (VIEW, T) -> Void) {
        self.source = source
        self.getView = getView
        self.spacing = spacing
        self.updateCell = updateCell
        self.stubView = getView()
        super.init()
    }
    
    func setAtEnd(action: @escaping () -> Void) {
        self.atEnd = action
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
