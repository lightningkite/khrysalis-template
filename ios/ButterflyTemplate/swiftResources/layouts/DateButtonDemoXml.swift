//
// DateButtonDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class DateButtonDemoXml {
    
    public unowned var xmlRoot: UIView!
    private var _layoutTests: Array<()->Bool> = []
    private func pickLayout(test: @escaping()->Bool) -> Bool {
        _layoutTests.append(test)
        return test()
    }
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.text = view
                view.font = UIFont.get(size: 16.0, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                DateButton(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.dateButton = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
            }
            
            view.addSubview(
                TimeButton(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.timeButton = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
            }
            
        }
        xmlRoot = view
        for test in _layoutTests { dependency.pickLayout(view: view, passOrFail: test) }
        return view
    }
    
    public var _text: UILabel!
    public var text: UILabel { get { return _text } set(value){ _text = value } }
    public var _dateButton: DateButton!
    public var dateButton: DateButton { get { return _dateButton } set(value){ _dateButton = value } }
    public var _timeButton: TimeButton!
    public var timeButton: TimeButton { get { return _timeButton } set(value){ _timeButton = value } }
    
}
