//Automatically created by Khrysalis
import UIKit
import LKButterfly

extension R.drawable {

static let ic_send_black_24dp: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let scaleX: CGFloat = CGFloat(24.0) / 24.0
    let scaleY: CGFloat = CGFloat(24.0) / 24.0
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 2.01, 21.0
        path.move(to: CGPoint(x: 2.01 * scaleX, y: 21.0 * scaleY))
        //L 23.0, 12.0, 2.01, 3.0, 2.0, 10.0
        path.addLine(to: CGPoint(x: 23.0 * scaleX, y: 12.0 * scaleY))
        path.addLine(to: CGPoint(x: 2.01 * scaleX, y: 3.0 * scaleY))
        path.addLine(to: CGPoint(x: 2.0 * scaleX, y: 10.0 * scaleY))
        //l 15.0, 2.0, -15.0, 2.0
        path.addLine(to: CGPoint(x: 17.0 * scaleX, y: 12.0 * scaleY))
        path.addLine(to: CGPoint(x: 2.0 * scaleX, y: 14.0 * scaleY))
        //z 
        path.closeSubpath()
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFF000000).cgColor
        return sublayer
    }())
    layer.bounds.size = CGSize(width: 24.0, height: 24.0)
    layer.scaleOverResize = true
    return layer
}

}
