//Automatically created by Khrysalis
import UIKit
import Butterfly

extension R.drawable {

static let ic_arrow_back_white_24dp: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let scaleX: CGFloat = CGFloat(24.0) / 24.0
    let scaleY: CGFloat = CGFloat(24.0) / 24.0
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 20.0, 11.0
        path.move(to: CGPoint(x: 20.0 * scaleX, y: 11.0 * scaleY))
        //H 7.83
        path.addLine(to: CGPoint(x: 7.83 * scaleX, y: 11.0 * scaleY))
        //l 5.59, -5.59
        path.addLine(to: CGPoint(x: 13.42 * scaleX, y: 5.41 * scaleY))
        //L 12.0, 4.0
        path.addLine(to: CGPoint(x: 12.0 * scaleX, y: 4.0 * scaleY))
        //l -8.0, 8.0, 8.0, 8.0, 1.41, -1.41
        path.addLine(to: CGPoint(x: 4.0 * scaleX, y: 12.0 * scaleY))
        path.addLine(to: CGPoint(x: 12.0 * scaleX, y: 20.0 * scaleY))
        path.addLine(to: CGPoint(x: 13.41 * scaleX, y: 18.59 * scaleY))
        //L 7.83, 13.0
        path.addLine(to: CGPoint(x: 7.83 * scaleX, y: 13.0 * scaleY))
        //H 20.0
        path.addLine(to: CGPoint(x: 20.0 * scaleX, y: 13.0 * scaleY))
        //v -2.0
        path.addLine(to: CGPoint(x: 20.0 * scaleX, y: 11.0 * scaleY))
        //z 
        path.closeSubpath()
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFFFFFFFF).cgColor
        return sublayer
    }())
    layer.bounds.size = CGSize(width: 24.0, height: 24.0)
    layer.scaleOverResize = true
    return layer
}

}
