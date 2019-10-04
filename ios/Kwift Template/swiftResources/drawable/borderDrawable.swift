//Automatically created by Kwift
import UIKit
import Kwift

extension ResourcesDrawables {

static func border(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    let part1: CALayer = {
        let sublayer = borderPart1(view: view)
        return sublayer
    }()
    let part2: CALayer = {
        let sublayer = borderPart2(view: view)
        return sublayer
    }()
    let part3: CALayer = {
        let sublayer = borderPart3(view: view)
        return sublayer
    }()
    
    layer.addOnStateChange(view) { [unowned layer] state in 
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        if state.contains(.highlighted) {
            layer.addSublayer(part1)
            return
        }
        if state.contains(.disabled) {
            layer.addSublayer(part2)
            return
        }
        layer.addSublayer(part3)
    }
    
    layer.matchSize(view)
    return layer
}
static func borderPart1(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.borderWidth = 1
    layer.borderColor = ResourcesColors.disabled.cgColor
    layer.backgroundColor = ResourcesColors.disabled.cgColor
    layer.cornerRadius = 3
    layer.matchSize(view)
    return layer
}
static func borderPart2(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.borderWidth = 1
    layer.borderColor = ResourcesColors.disabled.cgColor
    layer.backgroundColor = ResourcesColors.disabled.cgColor
    layer.cornerRadius = 3
    layer.matchSize(view)
    return layer
}
static func borderPart3(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.borderWidth = 1
    layer.borderColor = ResourcesColors.disabled.cgColor
    layer.backgroundColor = ResourcesColors.white.cgColor
    layer.cornerRadius = 3
    layer.matchSize(view)
    return layer
}

}
