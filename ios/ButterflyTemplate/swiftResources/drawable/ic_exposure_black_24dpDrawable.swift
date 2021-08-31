//Automatically created by Khrysalis
import UIKit
import LKButterfly

extension R.drawable {

static let ic_exposure_black_24dp: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let scaleX: CGFloat = CGFloat(24.0) / 24.0
    let scaleY: CGFloat = CGFloat(24.0) / 24.0
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 15.0, 17.0
        path.move(to: CGPoint(x: 15.0 * scaleX, y: 17.0 * scaleY))
        //v 2.0
        path.addLine(to: CGPoint(x: 15.0 * scaleX, y: 19.0 * scaleY))
        //h 2.0
        path.addLine(to: CGPoint(x: 17.0 * scaleX, y: 19.0 * scaleY))
        //v -2.0
        path.addLine(to: CGPoint(x: 17.0 * scaleX, y: 17.0 * scaleY))
        //h 2.0
        path.addLine(to: CGPoint(x: 19.0 * scaleX, y: 17.0 * scaleY))
        //v -2.0
        path.addLine(to: CGPoint(x: 19.0 * scaleX, y: 15.0 * scaleY))
        //h -2.0
        path.addLine(to: CGPoint(x: 17.0 * scaleX, y: 15.0 * scaleY))
        //v -2.0
        path.addLine(to: CGPoint(x: 17.0 * scaleX, y: 13.0 * scaleY))
        //h -2.0
        path.addLine(to: CGPoint(x: 15.0 * scaleX, y: 13.0 * scaleY))
        //v 2.0
        path.addLine(to: CGPoint(x: 15.0 * scaleX, y: 15.0 * scaleY))
        //h -2.0
        path.addLine(to: CGPoint(x: 13.0 * scaleX, y: 15.0 * scaleY))
        //v 2.0
        path.addLine(to: CGPoint(x: 13.0 * scaleX, y: 17.0 * scaleY))
        //h 2.0
        path.addLine(to: CGPoint(x: 15.0 * scaleX, y: 17.0 * scaleY))
        //z 
        path.closeSubpath()
        //M 20.0, 2.0
        path.move(to: CGPoint(x: 20.0 * scaleX, y: 2.0 * scaleY))
        //L 4.0, 2.0
        path.addLine(to: CGPoint(x: 4.0 * scaleX, y: 2.0 * scaleY))
        //c -1.1, 0.0, -2.0, 0.9, -2.0, 2.0
        path.addCurve(to: CGPoint(x: 2.0 * scaleX, y: 4.0 * scaleY), control1: CGPoint(x: 2.9 * scaleX, y: 2.0 * scaleY), control2: CGPoint(x: 2.0 * scaleX, y: 2.9 * scaleY))
        //v 16.0
        path.addLine(to: CGPoint(x: 2.0 * scaleX, y: 20.0 * scaleY))
        //c 0.0, 1.1, 0.9, 2.0, 2.0, 2.0
        path.addCurve(to: CGPoint(x: 4.0 * scaleX, y: 22.0 * scaleY), control1: CGPoint(x: 2.0 * scaleX, y: 21.1 * scaleY), control2: CGPoint(x: 2.9 * scaleX, y: 22.0 * scaleY))
        //h 16.0
        path.addLine(to: CGPoint(x: 20.0 * scaleX, y: 22.0 * scaleY))
        //c 1.1, 0.0, 2.0, -0.9, 2.0, -2.0
        path.addCurve(to: CGPoint(x: 22.0 * scaleX, y: 20.0 * scaleY), control1: CGPoint(x: 21.1 * scaleX, y: 22.0 * scaleY), control2: CGPoint(x: 22.0 * scaleX, y: 21.1 * scaleY))
        //L 22.0, 4.0
        path.addLine(to: CGPoint(x: 22.0 * scaleX, y: 4.0 * scaleY))
        //c 0.0, -1.1, -0.9, -2.0, -2.0, -2.0
        path.addCurve(to: CGPoint(x: 20.0 * scaleX, y: 2.0 * scaleY), control1: CGPoint(x: 22.0 * scaleX, y: 2.9 * scaleY), control2: CGPoint(x: 21.1 * scaleX, y: 2.0 * scaleY))
        //z 
        path.closeSubpath()
        //M 5.0, 5.0
        path.move(to: CGPoint(x: 5.0 * scaleX, y: 5.0 * scaleY))
        //h 6.0
        path.addLine(to: CGPoint(x: 11.0 * scaleX, y: 5.0 * scaleY))
        //v 2.0
        path.addLine(to: CGPoint(x: 11.0 * scaleX, y: 7.0 * scaleY))
        //L 5.0, 7.0
        path.addLine(to: CGPoint(x: 5.0 * scaleX, y: 7.0 * scaleY))
        //L 5.0, 5.0
        path.addLine(to: CGPoint(x: 5.0 * scaleX, y: 5.0 * scaleY))
        //z 
        path.closeSubpath()
        //M 20.0, 20.0
        path.move(to: CGPoint(x: 20.0 * scaleX, y: 20.0 * scaleY))
        //L 4.0, 20.0
        path.addLine(to: CGPoint(x: 4.0 * scaleX, y: 20.0 * scaleY))
        //L 20.0, 4.0
        path.addLine(to: CGPoint(x: 20.0 * scaleX, y: 4.0 * scaleY))
        //v 16.0
        path.addLine(to: CGPoint(x: 20.0 * scaleX, y: 20.0 * scaleY))
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
