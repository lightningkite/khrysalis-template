//Automatically created by Khrysalis
import UIKit
import LKButterfly

extension R.drawable {

static let button_disabled: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
    let part1: CALayer = {
        let sublayer = button_disabledPart1.makeLayer(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.startWith(layer.bounds).addWeak(sublayer) { (sublayer, bounds) in sublayer.resize(bounds) }
        return sublayer
    }()
    let part2: CALayer = {
        let sublayer = button_disabledPart2.makeLayer(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.startWith(layer.bounds).addWeak(sublayer) { (sublayer, bounds) in sublayer.resize(bounds) }
        return sublayer
    }()
    let part3: CALayer = {
        let sublayer = button_disabledPart3.makeLayer(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.startWith(layer.bounds).addWeak(sublayer) { (sublayer, bounds) in sublayer.resize(bounds) }
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
static let button_disabledPart1: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
applyColor(view, R.color.disabled) { (c, s) in
    layer.backgroundColor = c.cgColor
}
    layer.maxCornerRadius = 3.0
    layer.cornerRadius = 3.0
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}
static let button_disabledPart2: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
applyColor(view, R.color.disabled) { (c, s) in
    layer.backgroundColor = c.cgColor
}
    layer.maxCornerRadius = 3.0
    layer.cornerRadius = 3.0
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}
static let button_disabledPart3: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
applyColor(view, R.color.disabled) { (c, s) in
    layer.backgroundColor = c.cgColor
}
    layer.maxCornerRadius = 3.0
    layer.cornerRadius = 3.0
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}

}
