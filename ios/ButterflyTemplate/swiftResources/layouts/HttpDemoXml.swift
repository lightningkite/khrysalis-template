//
// HttpDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class HttpDemoXml {
    
    public unowned var xmlRoot: UIView!
    private var _layoutTests: Array<()->Bool> = []
    private func pickLayout(test: @escaping()->Bool) -> Bool {
        _layoutTests.append(test)
        return test()
    }
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = LinearLayout(frame: .zero)
        view.orientation = .y
        view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        view.gravity = .topLeft
        
        view.addSubview(
            UILabel(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            view.font = UIFont.get(size: 16.0, style: [])
            view.textString = R.string.this_data_is_loaded_from_json_placeholder_typicode
            view.numberOfLines = 0
            view.textColor = UIColor(argb: 0xFF222222)
        }
        
        view.addSubview(
            UIProgressView(frame: .zero),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: -1),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            gravity: .topFill,
            weight: 0
        ) { view in 
            self.progress = view
            view.progressViewStyle = .bar
            view.progressTintColor = R.color.colorPrimary
        }
        
        view.addSubview(
            UICollectionView(frame: .zero, collectionViewLayout: UICollectionView.ReversibleFlowLayout()),
            minimumSize: CGSize(width: 0, height: 0),
            size: CGSize(width: -1, height: 0.0),
            margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            padding: UIEdgeInsets.zero,
            gravity: .topFill,
            weight: 1.0
        ) { view in 
            self.items = view
            view.backgroundColor = UIColor.clear
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        xmlRoot = view
        for test in _layoutTests { dependency.pickLayout(view: view, passOrFail: test) }
        return view
    }
    
    public var _progress: UIProgressView!
    public var progress: UIProgressView { get { return _progress } set(value){ _progress = value } }
    public var _items: UICollectionView!
    public var items: UICollectionView { get { return _items } set(value){ _items = value } }
    
}
