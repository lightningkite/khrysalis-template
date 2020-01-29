//Automatically created by Khrysalis
import UIKit
import Khrysalis

extension ResourcesDrawables {

static func icArrowBackWhite24dp(_ view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 20.0, 11.0
        path.move(to: CGPoint(x: 20.0, y: 11.0))
        //H 7.83
        path.addLine(to: CGPoint(x: 7.83, y: 11.0))
        //l 5.59, -5.59
        path.addLine(to: CGPoint(x: 13.42, y: 5.41))
        //L 12.0, 4.0
        path.addLine(to: CGPoint(x: 12.0, y: 4.0))
        //l -8.0, 8.0, 8.0, 8.0, 1.41, -1.41
        path.addLine(to: CGPoint(x: 4.0, y: 12.0))
        path.addLine(to: CGPoint(x: 12.0, y: 20.0))
        path.addLine(to: CGPoint(x: 13.41, y: 18.59))
        //L 7.83, 13.0
        path.addLine(to: CGPoint(x: 7.83, y: 13.0))
        //H 20.0
        path.addLine(to: CGPoint(x: 20.0, y: 13.0))
        //v -2.0
        path.addLine(to: CGPoint(x: 20.0, y: 11.0))
        //z 
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFFFFFFFF).cgColor
        return sublayer
    }())
    layer.bounds.size = CGSize(width: 24.0, height: 24.0)
    layer.scaleOverResize = true
    return layer
}

}
