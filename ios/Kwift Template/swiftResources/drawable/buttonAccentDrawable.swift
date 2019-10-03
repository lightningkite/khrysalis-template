//Automatically created by Kwift
import UIKit

extension ResourcesDrawables {

static func buttonAccent(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    let part1: CALayer = {
        let sublayer = buttonAccentPart1(view: view)
        return sublayer
    }()
    let part2: CALayer = {
        let sublayer = buttonAccentPart2(view: view)
        return sublayer
    }()
    let part3: CALayer = {
        let sublayer = buttonAccentPart3(view: view)
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
static func buttonAccentPart1(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.backgroundColor = ResourcesColors.colorAccentDark.cgColor
    layer.cornerRadius = 3
    layer.matchSize(view)
    return layer
}
static func buttonAccentPart2(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.backgroundColor = ResourcesColors.disabled.cgColor
    layer.cornerRadius = 3
    layer.matchSize(view)
    return layer
}
static func buttonAccentPart3(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.backgroundColor = ResourcesColors.colorAccent.cgColor
    layer.cornerRadius = 3
    layer.matchSize(view)
    return layer
}

}
