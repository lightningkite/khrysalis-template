//Automatically created by Khrysalis
import UIKit
import Khrysalis

extension ResourcesDrawables {

static func icBeachAccessBlack24dp(_ view: UIView? = nil) -> CALayer {
    let scaleX: CGFloat = CGFloat(24) / 24.0
    let scaleY: CGFloat = CGFloat(24) / 24.0
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 13.127, 14.56
        path.move(to: CGPoint(x: 13.127 * scaleX, y: 14.56 * scaleY))
        //l 1.43, -1.43, 6.44, 6.443
        path.addLine(to: CGPoint(x: 14.557 * scaleX, y: 13.13 * scaleY))
        path.addLine(to: CGPoint(x: 20.997 * scaleX, y: 19.573 * scaleY))
        //L 19.57, 21.0
        path.addLine(to: CGPoint(x: 19.57 * scaleX, y: 21.0 * scaleY))
        //z 
        //M 17.42, 8.83
        path.move(to: CGPoint(x: 17.42 * scaleX, y: 8.83 * scaleY))
        //l 2.86, -2.86
        path.addLine(to: CGPoint(x: 20.28 * scaleX, y: 5.970000000000001 * scaleY))
        //c -3.95, -3.95, -10.35, -3.96, -14.3, -0.02, 3.93, -1.3, 8.31, -0.25, 11.44, 2.88
        path.addCurve(to: CGPoint(x: 5.98 * scaleX, y: 5.950000000000001 * scaleY), control1: CGPoint(x: 16.330000000000002 * scaleX, y: 2.0200000000000005 * scaleY), control2: CGPoint(x: 9.930000000000001 * scaleX, y: 2.0100000000000007 * scaleY))
        path.addCurve(to: CGPoint(x: 17.42 * scaleX, y: 8.830000000000002 * scaleY), control1: CGPoint(x: 9.91 * scaleX, y: 4.650000000000001 * scaleY), control2: CGPoint(x: 14.290000000000001 * scaleX, y: 5.700000000000001 * scaleY))
        //z 
        //M 5.95, 5.98
        path.move(to: CGPoint(x: 5.95 * scaleX, y: 5.98 * scaleY))
        //c -3.94, 3.95, -3.93, 10.35, 0.02, 14.3
        path.addCurve(to: CGPoint(x: 5.97 * scaleX, y: 20.28 * scaleY), control1: CGPoint(x: 2.0100000000000002 * scaleX, y: 9.93 * scaleY), control2: CGPoint(x: 2.02 * scaleX, y: 16.33 * scaleY))
        //l 2.86, -2.86
        path.addLine(to: CGPoint(x: 8.83 * scaleX, y: 17.42 * scaleY))
        //C 5.7, 14.29, 4.65, 9.91, 5.95, 5.98
        path.addCurve(to: CGPoint(x: 5.95 * scaleX, y: 5.98 * scaleY), control1: CGPoint(x: 5.7 * scaleX, y: 14.29 * scaleY), control2: CGPoint(x: 4.65 * scaleX, y: 9.91 * scaleY))
        //z 
        //M 5.97, 5.96
        path.move(to: CGPoint(x: 5.97 * scaleX, y: 5.96 * scaleY))
        //l -0.01, 0.01
        path.addLine(to: CGPoint(x: 5.96 * scaleX, y: 5.97 * scaleY))
        //c -0.38, 3.01, 1.17, 6.88, 4.3, 10.02
        path.addCurve(to: CGPoint(x: 10.26 * scaleX, y: 15.989999999999998 * scaleY), control1: CGPoint(x: 5.58 * scaleX, y: 8.98 * scaleY), control2: CGPoint(x: 7.13 * scaleX, y: 12.85 * scaleY))
        //l 5.73, -5.73
        path.addLine(to: CGPoint(x: 15.99 * scaleX, y: 10.259999999999998 * scaleY))
        //c -3.13, -3.13, -7.01, -4.68, -10.02, -4.3
        path.addCurve(to: CGPoint(x: 5.970000000000001 * scaleX, y: 5.959999999999998 * scaleY), control1: CGPoint(x: 12.86 * scaleX, y: 7.129999999999998 * scaleY), control2: CGPoint(x: 8.98 * scaleX, y: 5.579999999999998 * scaleY))
        //z 
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFF000000).cgColor
        return sublayer
    }())
    layer.bounds.size = CGSize(width: 24.0, height: 24.0)
    layer.scaleOverResize = true
    return layer
}

}
