//Automatically created by Khrysalis
import UIKit
import Butterfly

extension R.drawable {

static let ic_android_black_24dp: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let scaleX: CGFloat = CGFloat(24.0) / 24.0
    let scaleY: CGFloat = CGFloat(24.0) / 24.0
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 6.0, 18.0
        path.move(to: CGPoint(x: 6.0 * scaleX, y: 18.0 * scaleY))
        //c 0.0, 0.55, 0.45, 1.0, 1.0, 1.0
        path.addCurve(to: CGPoint(x: 7.0 * scaleX, y: 19.0 * scaleY), control1: CGPoint(x: 6.0 * scaleX, y: 18.55 * scaleY), control2: CGPoint(x: 6.45 * scaleX, y: 19.0 * scaleY))
        //h 1.0
        path.addLine(to: CGPoint(x: 8.0 * scaleX, y: 19.0 * scaleY))
        //v 3.5
        path.addLine(to: CGPoint(x: 8.0 * scaleX, y: 22.5 * scaleY))
        //c 0.0, 0.83, 0.67, 1.5, 1.5, 1.5
        path.addCurve(to: CGPoint(x: 9.5 * scaleX, y: 24.0 * scaleY), control1: CGPoint(x: 8.0 * scaleX, y: 23.33 * scaleY), control2: CGPoint(x: 8.67 * scaleX, y: 24.0 * scaleY))
        //s 1.5, -0.67, 1.5, -1.5
        path.addCurve(to: CGPoint(x: 11.0 * scaleX, y: 22.5 * scaleY), control1: CGPoint(x: 10.33 * scaleX, y: 24.0 * scaleY), control2: CGPoint(x: 11.0 * scaleX, y: 23.33 * scaleY))
        //L 11.0, 19.0
        path.addLine(to: CGPoint(x: 11.0 * scaleX, y: 19.0 * scaleY))
        //h 2.0
        path.addLine(to: CGPoint(x: 13.0 * scaleX, y: 19.0 * scaleY))
        //v 3.5
        path.addLine(to: CGPoint(x: 13.0 * scaleX, y: 22.5 * scaleY))
        //c 0.0, 0.83, 0.67, 1.5, 1.5, 1.5
        path.addCurve(to: CGPoint(x: 14.5 * scaleX, y: 24.0 * scaleY), control1: CGPoint(x: 13.0 * scaleX, y: 23.33 * scaleY), control2: CGPoint(x: 13.67 * scaleX, y: 24.0 * scaleY))
        //s 1.5, -0.67, 1.5, -1.5
        path.addCurve(to: CGPoint(x: 16.0 * scaleX, y: 22.5 * scaleY), control1: CGPoint(x: 15.33 * scaleX, y: 24.0 * scaleY), control2: CGPoint(x: 16.0 * scaleX, y: 23.33 * scaleY))
        //L 16.0, 19.0
        path.addLine(to: CGPoint(x: 16.0 * scaleX, y: 19.0 * scaleY))
        //h 1.0
        path.addLine(to: CGPoint(x: 17.0 * scaleX, y: 19.0 * scaleY))
        //c 0.55, 0.0, 1.0, -0.45, 1.0, -1.0
        path.addCurve(to: CGPoint(x: 18.0 * scaleX, y: 18.0 * scaleY), control1: CGPoint(x: 17.55 * scaleX, y: 19.0 * scaleY), control2: CGPoint(x: 18.0 * scaleX, y: 18.55 * scaleY))
        //L 18.0, 8.0
        path.addLine(to: CGPoint(x: 18.0 * scaleX, y: 8.0 * scaleY))
        //L 6.0, 8.0
        path.addLine(to: CGPoint(x: 6.0 * scaleX, y: 8.0 * scaleY))
        //v 10.0
        path.addLine(to: CGPoint(x: 6.0 * scaleX, y: 18.0 * scaleY))
        //z 
        //M 3.5, 8.0
        path.move(to: CGPoint(x: 3.5 * scaleX, y: 8.0 * scaleY))
        //C 2.67, 8.0, 2.0, 8.67, 2.0, 9.5
        path.addCurve(to: CGPoint(x: 2.0 * scaleX, y: 9.5 * scaleY), control1: CGPoint(x: 2.67 * scaleX, y: 8.0 * scaleY), control2: CGPoint(x: 2.0 * scaleX, y: 8.67 * scaleY))
        //v 7.0
        path.addLine(to: CGPoint(x: 2.0 * scaleX, y: 16.5 * scaleY))
        //c 0.0, 0.83, 0.67, 1.5, 1.5, 1.5
        path.addCurve(to: CGPoint(x: 3.5 * scaleX, y: 18.0 * scaleY), control1: CGPoint(x: 2.0 * scaleX, y: 17.33 * scaleY), control2: CGPoint(x: 2.67 * scaleX, y: 18.0 * scaleY))
        //S 5.0, 17.33, 5.0, 16.5
        path.addCurve(to: CGPoint(x: 5.0 * scaleX, y: 16.5 * scaleY), control1: CGPoint(x: 4.33 * scaleX, y: 18.0 * scaleY), control2: CGPoint(x: 5.0 * scaleX, y: 17.33 * scaleY))
        //v -7.0
        path.addLine(to: CGPoint(x: 5.0 * scaleX, y: 9.5 * scaleY))
        //C 5.0, 8.67, 4.33, 8.0, 3.5, 8.0
        path.addCurve(to: CGPoint(x: 3.5 * scaleX, y: 8.0 * scaleY), control1: CGPoint(x: 5.0 * scaleX, y: 8.67 * scaleY), control2: CGPoint(x: 4.33 * scaleX, y: 8.0 * scaleY))
        //z 
        //M 20.5, 8.0
        path.move(to: CGPoint(x: 20.5 * scaleX, y: 8.0 * scaleY))
        //c -0.83, 0.0, -1.5, 0.67, -1.5, 1.5
        path.addCurve(to: CGPoint(x: 19.0 * scaleX, y: 9.5 * scaleY), control1: CGPoint(x: 19.67 * scaleX, y: 8.0 * scaleY), control2: CGPoint(x: 19.0 * scaleX, y: 8.67 * scaleY))
        //v 7.0
        path.addLine(to: CGPoint(x: 19.0 * scaleX, y: 16.5 * scaleY))
        //c 0.0, 0.83, 0.67, 1.5, 1.5, 1.5
        path.addCurve(to: CGPoint(x: 20.5 * scaleX, y: 18.0 * scaleY), control1: CGPoint(x: 19.0 * scaleX, y: 17.33 * scaleY), control2: CGPoint(x: 19.67 * scaleX, y: 18.0 * scaleY))
        //s 1.5, -0.67, 1.5, -1.5
        path.addCurve(to: CGPoint(x: 22.0 * scaleX, y: 16.5 * scaleY), control1: CGPoint(x: 21.33 * scaleX, y: 18.0 * scaleY), control2: CGPoint(x: 22.0 * scaleX, y: 17.33 * scaleY))
        //v -7.0
        path.addLine(to: CGPoint(x: 22.0 * scaleX, y: 9.5 * scaleY))
        //c 0.0, -0.83, -0.67, -1.5, -1.5, -1.5
        path.addCurve(to: CGPoint(x: 20.5 * scaleX, y: 8.0 * scaleY), control1: CGPoint(x: 22.0 * scaleX, y: 8.67 * scaleY), control2: CGPoint(x: 21.33 * scaleX, y: 8.0 * scaleY))
        //z 
        //M 15.53, 2.16
        path.move(to: CGPoint(x: 15.53 * scaleX, y: 2.16 * scaleY))
        //l 1.3, -1.3
        path.addLine(to: CGPoint(x: 16.83 * scaleX, y: 0.8600000000000001 * scaleY))
        //c 0.2, -0.2, 0.2, -0.51, 0.0, -0.71, -0.2, -0.2, -0.51, -0.2, -0.71, 0.0
        path.addCurve(to: CGPoint(x: 16.83 * scaleX, y: 0.15000000000000013 * scaleY), control1: CGPoint(x: 17.029999999999998 * scaleX, y: 0.6600000000000001 * scaleY), control2: CGPoint(x: 17.029999999999998 * scaleX, y: 0.3500000000000001 * scaleY))
        path.addCurve(to: CGPoint(x: 16.119999999999997 * scaleX, y: 0.15000000000000013 * scaleY), control1: CGPoint(x: 16.63 * scaleX, y: -0.04999999999999988 * scaleY), control2: CGPoint(x: 16.319999999999997 * scaleX, y: -0.04999999999999988 * scaleY))
        //l -1.48, 1.48
        path.addLine(to: CGPoint(x: 14.639999999999997 * scaleX, y: 1.6300000000000001 * scaleY))
        //C 13.85, 1.23, 12.95, 1.0, 12.0, 1.0
        path.addCurve(to: CGPoint(x: 12.0 * scaleX, y: 1.0 * scaleY), control1: CGPoint(x: 13.85 * scaleX, y: 1.23 * scaleY), control2: CGPoint(x: 12.95 * scaleX, y: 1.0 * scaleY))
        //c -0.96, 0.0, -1.86, 0.23, -2.66, 0.63
        path.addCurve(to: CGPoint(x: 9.34 * scaleX, y: 1.63 * scaleY), control1: CGPoint(x: 11.04 * scaleX, y: 1.0 * scaleY), control2: CGPoint(x: 10.14 * scaleX, y: 1.23 * scaleY))
        //L 7.85, 0.15
        path.addLine(to: CGPoint(x: 7.85 * scaleX, y: 0.15 * scaleY))
        //c -0.2, -0.2, -0.51, -0.2, -0.71, 0.0, -0.2, 0.2, -0.2, 0.51, 0.0, 0.71
        path.addCurve(to: CGPoint(x: 7.14 * scaleX, y: 0.15 * scaleY), control1: CGPoint(x: 7.6499999999999995 * scaleX, y: -0.05000000000000002 * scaleY), control2: CGPoint(x: 7.34 * scaleX, y: -0.05000000000000002 * scaleY))
        path.addCurve(to: CGPoint(x: 7.14 * scaleX, y: 0.86 * scaleY), control1: CGPoint(x: 6.9399999999999995 * scaleX, y: 0.35 * scaleY), control2: CGPoint(x: 6.9399999999999995 * scaleX, y: 0.66 * scaleY))
        //l 1.31, 1.31
        path.addLine(to: CGPoint(x: 8.45 * scaleX, y: 2.17 * scaleY))
        //C 6.97, 3.26, 6.0, 5.01, 6.0, 7.0
        path.addCurve(to: CGPoint(x: 6.0 * scaleX, y: 7.0 * scaleY), control1: CGPoint(x: 6.97 * scaleX, y: 3.26 * scaleY), control2: CGPoint(x: 6.0 * scaleX, y: 5.01 * scaleY))
        //h 12.0
        path.addLine(to: CGPoint(x: 18.0 * scaleX, y: 7.0 * scaleY))
        //c 0.0, -1.99, -0.97, -3.75, -2.47, -4.84
        path.addCurve(to: CGPoint(x: 15.53 * scaleX, y: 2.16 * scaleY), control1: CGPoint(x: 18.0 * scaleX, y: 5.01 * scaleY), control2: CGPoint(x: 17.03 * scaleX, y: 3.25 * scaleY))
        //z 
        //M 10.0, 5.0
        path.move(to: CGPoint(x: 10.0 * scaleX, y: 5.0 * scaleY))
        //L 9.0, 5.0
        path.addLine(to: CGPoint(x: 9.0 * scaleX, y: 5.0 * scaleY))
        //L 9.0, 4.0
        path.addLine(to: CGPoint(x: 9.0 * scaleX, y: 4.0 * scaleY))
        //h 1.0
        path.addLine(to: CGPoint(x: 10.0 * scaleX, y: 4.0 * scaleY))
        //v 1.0
        path.addLine(to: CGPoint(x: 10.0 * scaleX, y: 5.0 * scaleY))
        //z 
        //M 15.0, 5.0
        path.move(to: CGPoint(x: 15.0 * scaleX, y: 5.0 * scaleY))
        //h -1.0
        path.addLine(to: CGPoint(x: 14.0 * scaleX, y: 5.0 * scaleY))
        //L 14.0, 4.0
        path.addLine(to: CGPoint(x: 14.0 * scaleX, y: 4.0 * scaleY))
        //h 1.0
        path.addLine(to: CGPoint(x: 15.0 * scaleX, y: 4.0 * scaleY))
        //v 1.0
        path.addLine(to: CGPoint(x: 15.0 * scaleX, y: 5.0 * scaleY))
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
