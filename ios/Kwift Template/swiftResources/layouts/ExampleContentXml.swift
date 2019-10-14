//
// ExampleContentXml.swift
// Created by Kwift XML
//

import UIKit
import FlexLayout
import PinLayout
import Kwift

class ExampleContentXml {
    
    unowned var exampleContentNumber: UILabel!
    unowned var exampleContentIncrement: UIButton!
    unowned var xmlRoot: UIView!
    
    func setup(_ dependency: ViewDependency) -> UIView {
        let result = LinearLayout(frame: .zero)
        result.orientation = .y
        
        func addOrientationTest(color: UIColor, align: Align, weight: CGFloat = 0) {
            let view = UIView(frame: .zero)
            view.backgroundColor = color
            result.addSubview(view, LinearLayout.LayoutParams(
                size: CGSize(width: 20, height: 20),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: AlignPair(horizontal: align, vertical: .start),
                weight: weight
            ))
        }
        
        addOrientationTest(color: .red, align: .start)
        addOrientationTest(color: .red, align: .center)
        addOrientationTest(color: .red, align: .end)
        addOrientationTest(color: .red, align: .start)
        addOrientationTest(color: .red, align: .center)
        addOrientationTest(color: .red, align: .end)
        addOrientationTest(color: .green, align: .fill)
        addOrientationTest(color: .red, align: .start)
        addOrientationTest(color: .red, align: .center)
        addOrientationTest(color: .red, align: .end)
        
        
        let horizontal = LinearLayout(frame: .zero)
        horizontal.orientation = .x
        
        let numLabel = UILabel(frame: .zero)
        numLabel.text = "0"
        horizontal.addSubview(numLabel, LinearLayout.LayoutParams(
            size: .zero,
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            gravity: .center,
            weight: 1
        ))
        exampleContentNumber = numLabel
        
        let button = UIButton(frame: .zero)
        button.setTitle("Increment", for: .normal)
        button.backgroundLayer = ResourcesDrawables.buttonPrimary(view: button)
        horizontal.addSubview(button, LinearLayout.LayoutParams(
            size: .zero,
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            gravity: .center,
            weight: 0
        ))
        exampleContentIncrement = button
        
        result.addSubview(horizontal, LinearLayout.LayoutParams(
            size: .zero,
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            gravity: AlignPair(horizontal: .fill, vertical: .start),
            weight: 0
        ))
        
        let frame = FrameLayout(frame: .zero)
        func addFrameTest(color: UIColor, align: AlignPair) {
            let sub = UIView()
            sub.backgroundColor = color
            frame.addSubview(sub, FrameLayout.LayoutParams(
                size: CGSize(width: 20, height: 20),
                margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                gravity: align
            ))
        }
        addFrameTest(color: .black, align: .fill)
        addFrameTest(color: .red, align: .topFill)
        addFrameTest(color: .red, align: .centerFill)
        addFrameTest(color: .red, align: .bottomFill)
        addFrameTest(color: .green, align: .fillLeft)
        addFrameTest(color: .green, align: .fillCenter)
        addFrameTest(color: .green, align: .fillRight)
        addFrameTest(color: .blue, align: .topLeft)
        addFrameTest(color: .blue, align: .topCenter)
        addFrameTest(color: .blue, align: .topRight)
        addFrameTest(color: .blue, align: .centerLeft)
        addFrameTest(color: .blue, align: .centerCenter)
        addFrameTest(color: .blue, align: .centerRight)
        addFrameTest(color: .blue, align: .bottomLeft)
        addFrameTest(color: .blue, align: .bottomCenter)
        addFrameTest(color: .blue, align: .bottomRight)
        result.addSubview(frame, LinearLayout.LayoutParams(
            size: .zero,
            margin: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            gravity: AlignPair(horizontal: .fill, vertical: .start),
            weight: 1
        ))
        
        xmlRoot = result
        return result
    }
    
}
