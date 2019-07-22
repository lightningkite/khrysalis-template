//
//  FillingCALayer.swift
//  Lifting Generations
//
//  Created by Joseph Ivie on 3/21/19.
//  Copyright © 2019 Joseph Ivie. All rights reserved.
//

import Foundation
import UIKit


class FillingCALayer : CALayer {
    init(_ layer: CALayer) {
        super.init()
        addSublayer(layer)
        let desc = String(describing: delegate)
        print("Hello \(desc)")
        needsDisplay()
        displayIfNeeded()
        frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    override init(layer: Any) {
        super.init(layer: layer)
        needsDisplay()
        displayIfNeeded()
        print("Duplicated")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        needsDisplay()
        displayIfNeeded()
        print("Coder")
    }
    
    override func render(in ctx: CGContext) {
        print("render is fixing")
        bounds = superlayer?.bounds ?? CGRect.zero
        for l in sublayers ?? [] {
            l.bounds = self.bounds
        }
        super.render(in: ctx)
    }
    override func draw(in ctx: CGContext) {
        print("draw is fixing")
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fill(bounds)
        bounds = superlayer?.bounds ?? CGRect.zero
        for l in sublayers ?? [] {
            l.bounds = self.bounds
        }
        super.draw(in: ctx)
    }
}

