//
// DateButtonDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class DateButtonDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            view.gravity = .topLeft
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.text = view
                view.font = UIFont.get(size: 16, style: [])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                DateButton(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.dateButton = view
                view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
                view.titleLabel?.font = UIFont.get(size: 16, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
            }
            
            view.addSubview(
                TimeButton(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.timeButton = view
                view.backgroundLayer = ResourcesDrawables.buttonPrimary(view)
                view.titleLabel?.font = UIFont.get(size: 16, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8, left:8, bottom:8, right:8)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var dateButton: DateButton!
    public unowned var timeButton: TimeButton!
    public unowned var text: UILabel!
    
}
