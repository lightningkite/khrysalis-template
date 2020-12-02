//
// SliderDemoXml.swift
// Created by Khrysalis XML
//

import UIKit
import Butterfly
import MapKit

public class SliderDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(dependency: ViewControllerAccess) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.gravity = .topLeft
            
            view.addSubview(
                UISlider(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.slider = view
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.valueDisplay = view
                view.font = UIFont.get(size: 24.0, style: ["bold"])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UIProgressView(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.progress = view
                view.progressViewStyle = .bar
                view.progressTintColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.rating = view
                view.settings.starSize = 48
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStars = view
                view.settings.starSize = 32
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStarsSmall = view
                view.settings.starSize = 16
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.ratingDisplayNumber = view
                view.font = UIFont.get(size: 24.0, style: ["bold"])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingFloat = view
                view.settings.starSize = 48
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStarsFloat = view
                view.settings.starSize = 32
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topLeft,
                weight: 0
            ) { view in 
                self.ratingDisplayStarsSmallFloat = view
                view.settings.starSize = 16
                view.settings.updateOnTouch = false
                view.settings.emptyColor = UIColor(argb: 0xFF888888)
                view.settings.emptyBorderColor = UIColor(argb: 0xFF888888)
                view.settings.filledColor = UIColor(argb: 0xFFFFFF00)
                view.settings.filledBorderColor = UIColor(argb: 0xFFFFFF00)
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: -1, height: -1),
                margin: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.ratingDisplayNumberFloat = view
                view.font = UIFont.get(size: 24.0, style: ["bold"])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public var _slider: UISlider!
    public var slider: UISlider { get { return _slider } set(value){ _slider = value } }
    public var _valueDisplay: UILabel!
    public var valueDisplay: UILabel { get { return _valueDisplay } set(value){ _valueDisplay = value } }
    public var _progress: UIProgressView!
    public var progress: UIProgressView { get { return _progress } set(value){ _progress = value } }
    public var _rating: UIRatingBar!
    public var rating: UIRatingBar { get { return _rating } set(value){ _rating = value } }
    public var _ratingDisplayStars: UIRatingBar!
    public var ratingDisplayStars: UIRatingBar { get { return _ratingDisplayStars } set(value){ _ratingDisplayStars = value } }
    public var _ratingDisplayStarsSmall: UIRatingBar!
    public var ratingDisplayStarsSmall: UIRatingBar { get { return _ratingDisplayStarsSmall } set(value){ _ratingDisplayStarsSmall = value } }
    public var _ratingDisplayNumber: UILabel!
    public var ratingDisplayNumber: UILabel { get { return _ratingDisplayNumber } set(value){ _ratingDisplayNumber = value } }
    public var _ratingFloat: UIRatingBar!
    public var ratingFloat: UIRatingBar { get { return _ratingFloat } set(value){ _ratingFloat = value } }
    public var _ratingDisplayStarsFloat: UIRatingBar!
    public var ratingDisplayStarsFloat: UIRatingBar { get { return _ratingDisplayStarsFloat } set(value){ _ratingDisplayStarsFloat = value } }
    public var _ratingDisplayStarsSmallFloat: UIRatingBar!
    public var ratingDisplayStarsSmallFloat: UIRatingBar { get { return _ratingDisplayStarsSmallFloat } set(value){ _ratingDisplayStarsSmallFloat = value } }
    public var _ratingDisplayNumberFloat: UILabel!
    public var ratingDisplayNumberFloat: UILabel { get { return _ratingDisplayNumberFloat } set(value){ _ratingDisplayNumberFloat = value } }
    
}
