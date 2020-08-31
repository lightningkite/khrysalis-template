//
// ExternalTestXml.swift
// Created by Khrysalis XML
//

import UIKit
import Khrysalis
import MapKit

public class ExternalTestXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewDependency) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        self.scrollView = view
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
            view.gravity = .topLeft
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.openMap = view
                view.backgroundLayer = R.drawable.button_primary.makeLayer(view)
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Show me Lightning Kite's Location"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Show me Lightning Kite's Location"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.openWeb = view
                view.backgroundLayer = R.drawable.button_primary.makeLayer(view)
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Show me Lightning Kite's Website"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Show me Lightning Kite's Website"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.openEvent = view
                view.backgroundLayer = R.drawable.button_primary.makeLayer(view)
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Show me a future event"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Show me a future event"
                view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                view.contentHorizontalAlignment = .center
                view.contentMode = .scaleAspectFit
                view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var scrollView: ScrollViewVertical!
    public unowned var openMap: UIButtonWithLayer!
    public unowned var openEvent: UIButtonWithLayer!
    public unowned var openWeb: UIButtonWithLayer!
    
}
