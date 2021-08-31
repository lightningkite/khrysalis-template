//
// ExampleContentXml.swift
// Created by Khrysalis XML
//

import UIKit
import LKButterfly
import MapKit

public class ExampleContentXml {
    
    public unowned var xmlRoot: UIView!
    private var _layoutTests: Array<()->Bool> = []
    private func pickLayout(test: @escaping()->Bool) -> Bool {
        _layoutTests.append(test)
        return test()
    }
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        self.scrollView = view
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
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 24.0, style: ["bold"])
                view.textString = R.string.welcome
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.font = UIFont.get(size: 16.0, style: [])
                view.textString = R.string.welcome_message
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF222222)
            }
            
            view.addSubview(
                LinearLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.orientation = .x
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.gravity = .centerCenter
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0.0, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    self.exampleContentNumber = view
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "0"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 0
                ) { view in 
                    self.exampleContentIncrement = view
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = R.string.increment_the_number
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = R.string.increment_the_number
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
                }
                
            }
            
            view.addSubview(
                LinearLayout(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets.zero,
                gravity: .topFill,
                weight: 0
            ) { view in 
                view.orientation = .x
                view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                view.gravity = .centerCenter
                
                view.addSubview(
                    UILabel(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: 0.0, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                    gravity: .centerCenter,
                    weight: 1.0
                ) { view in 
                    self.chainedNumber = view
                    view.font = UIFont.get(size: 16.0, style: [])
                    view.textString = "0"
                    view.numberOfLines = 0
                    view.textColor = UIColor(argb: 0xFF222222)
                }
                
                view.addSubview(
                    UIButtonWithLayer(frame: .zero),
                    minimumSize: CGSize(width: 0, height: 0),
                    size: CGSize(width: -1, height: -1),
                    margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                    padding: UIEdgeInsets.zero,
                    gravity: .centerCenter,
                    weight: 0
                ) { view in 
                    self.chainedIncrement = view
                    view.backgroundDrawable = R.drawable.button_primary
                    view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                    view.titleLabel?.textAllCaps = false
                    view.titleLabel?.textString = R.string.increment_the_number
                    view.titleLabel?.numberOfLines = 0
                    view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                    view.textAllCaps = false
                    view.textString = R.string.increment_the_number
                    view.setTitleColor(UIColor(argb: 0xFFFFFFFF), for: .normal)
                    view.contentHorizontalAlignment = .center
                    view.contentMode = .scaleAspectFit
                    view.contentEdgeInsets = UIEdgeInsets(top: 8.0, left:8.0, bottom:8.0, right:8.0)
                }
                
            }
            
            view.addSubview(
                UIImageView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 100.0, height: 50.0),
                margin: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                view.image = UIImage(named: "reason_expertise") ?? R.drawable.reason_expertise.makeLayer(view).toImage()
                view.clipsToBounds = true
                view.contentMode = .scaleAspectFit
            }
            
            view.addSubview(
                UIButtonWithLayer(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets.zero,
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.scrollToTop = view
                view.backgroundDrawable = R.drawable.button_primary
                view.titleLabel?.font = UIFont.get(size: 16.0, style: [])
                view.titleLabel?.textAllCaps = false
                view.titleLabel?.textString = "Scroll to Top"
                view.titleLabel?.numberOfLines = 0
                view.titleLabel?.textColor = UIColor(argb: 0xFFFFFFFF)
                view.textAllCaps = false
                view.textString = "Scroll to Top"
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
    
    public var _scrollView: ScrollViewVertical!
    public var scrollView: ScrollViewVertical { get { return _scrollView } set(value){ _scrollView = value } }
    public var _exampleContentNumber: UILabel!
    public var exampleContentNumber: UILabel { get { return _exampleContentNumber } set(value){ _exampleContentNumber = value } }
    public var _exampleContentIncrement: UIButtonWithLayer!
    public var exampleContentIncrement: UIButtonWithLayer { get { return _exampleContentIncrement } set(value){ _exampleContentIncrement = value } }
    public var _chainedNumber: UILabel!
    public var chainedNumber: UILabel { get { return _chainedNumber } set(value){ _chainedNumber = value } }
    public var _chainedIncrement: UIButtonWithLayer!
    public var chainedIncrement: UIButtonWithLayer { get { return _chainedIncrement } set(value){ _chainedIncrement = value } }
    public var _scrollToTop: UIButtonWithLayer!
    public var scrollToTop: UIButtonWithLayer { get { return _scrollToTop } set(value){ _scrollToTop = value } }
    
}
