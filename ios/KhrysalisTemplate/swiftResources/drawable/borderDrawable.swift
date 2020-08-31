//Automatically created by Khrysalis
import UIKit
import Khrysalis

extension R.drawable {

static let border: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
    let part1: CALayer = {
        let sublayer = borderPart1.makeLayer(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.startWith(layer.bounds).addWeak(sublayer) { (sublayer, bounds) in sublayer.resize(bounds) }
        return sublayer
    }()
    let part2: CALayer = {
        let sublayer = borderPart2.makeLayer(view)
        layer.bounds.size = layer.bounds.size.expand(sublayer.bounds.size)
        layer.onResize.startWith(layer.bounds).addWeak(sublayer) { (sublayer, bounds) in sublayer.resize(bounds) }
        return sublayer
    }()
    let part3: CALayer = {
        let sublayer = borderPart3.makeLayer(view)
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
static let borderPart1: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
    layer.borderWidth = 1.0
applyColor(view, R.color.disabled) { (c, s) in
    layer.borderColor = c.cgColor
}
applyColor(view, R.color.disabled) { (c, s) in
    layer.backgroundColor = c.cgColor
}
    layer.maxCornerRadius = 3.0
    layer.cornerRadius = 3.0
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}
static let borderPart2: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
    layer.borderWidth = 1.0
applyColor(view, R.color.disabled) { (c, s) in
    layer.borderColor = c.cgColor
}
applyColor(view, R.color.disabled) { (c, s) in
    layer.backgroundColor = c.cgColor
}
    layer.maxCornerRadius = 3.0
    layer.cornerRadius = 3.0
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}
static let borderPart3: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let layer = CALayer()
    layer.borderWidth = 1.0
applyColor(view, R.color.disabled) { (c, s) in
    layer.borderColor = c.cgColor
}
applyColor(view, R.color.white) { (c, s) in
    layer.backgroundColor = c.cgColor
}
    layer.maxCornerRadius = 3.0
    layer.cornerRadius = 3.0
    layer.bounds.size = CGSize(width: 100, height: 100)
    return layer
}

}
