//Automatically created by Kwift
import UIKit
import Kwift

extension ResourcesDrawables {

static func buttonPrimary(_ view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    let part1: CALayer = {
        let sublayer = buttonPrimaryPart1(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.addAndRunWeak(sublayer, layer.bounds) { (sublayer, bounds) in sublayer.frame = bounds }
        return sublayer
    }()
    let part2: CALayer = {
        let sublayer = buttonPrimaryPart2(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.addAndRunWeak(sublayer, layer.bounds) { (sublayer, bounds) in sublayer.frame = bounds }
        return sublayer
    }()
    let part3: CALayer = {
        let sublayer = buttonPrimaryPart3(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.addAndRunWeak(sublayer, layer.bounds) { (sublayer, bounds) in sublayer.frame = bounds }
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
    
    return layer
}
static func buttonPrimaryPart1(_ view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.backgroundColor = ResourcesColors.colorPrimaryDark.cgColor
    layer.cornerRadius = 3
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}
static func buttonPrimaryPart2(_ view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.backgroundColor = ResourcesColors.disabled.cgColor
    layer.cornerRadius = 3
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}
static func buttonPrimaryPart3(_ view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.backgroundColor = ResourcesColors.colorPrimary.cgColor
    layer.cornerRadius = 3
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}

}
