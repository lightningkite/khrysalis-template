//
// SliderDemoXml.swift
// Created by Kwift XML
//

import UIKit
import Kwift
import MapKit

public class SliderDemoXml {
    
    public unowned var xmlRoot: UIView!
    public func setup(_ dependency: ViewDependency) -> UIView {
        let view = ScrollViewVertical(frame: .zero)
        view.addSubview(LinearLayout(frame: .zero)) { view in 
            view.orientation = .y
            view.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            view.gravity = .topLeft
            
            view.addSubview(
                UISlider(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.slider = view
            }
            
            view.addSubview(
                UILabel(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.valueDisplay = view
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
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
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
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
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
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
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.ratingDisplayNumber = view
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
            view.addSubview(
                UIRatingBar(frame: .zero),
                minimumSize: CGSize(width: 0, height: 0),
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
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
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
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
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
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
                size: CGSize(width: 0, height: 0),
                margin: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                gravity: .topFill,
                weight: 0
            ) { view in 
                self.ratingDisplayNumberFloat = view
                view.font = UIFont.get(size: 24, style: ["bold"])
                view.numberOfLines = 0
                view.textColor = UIColor(argb: 0xFF000000)
            }
            
        }
        xmlRoot = view
        return view
    }
    
    public unowned var slider: UISlider!
    public unowned var valueDisplay: UILabel!
    public unowned var ratingDisplayNumber: UILabel!
    public unowned var ratingDisplayStars: UIRatingBar!
    public unowned var ratingDisplayNumberFloat: UILabel!
    public unowned var rating: UIRatingBar!
    public unowned var ratingFloat: UIRatingBar!
    public unowned var ratingDisplayStarsFloat: UIRatingBar!
    public unowned var ratingDisplayStarsSmall: UIRatingBar!
    public unowned var ratingDisplayStarsSmallFloat: UIRatingBar!
    
}
