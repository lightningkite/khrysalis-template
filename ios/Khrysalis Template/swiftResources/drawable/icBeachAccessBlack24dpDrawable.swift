//Automatically created by Khrysalis
import UIKit
import Khrysalis

extension ResourcesDrawables {

static func icBeachAccessBlack24dp(_ view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 13.127, 14.56
        path.move(to: CGPoint(x: 13.127, y: 14.56))
        //l 1.43, -1.43, 6.44, 6.443
        path.addLine(to: CGPoint(x: 14.557, y: 13.13))
        path.addLine(to: CGPoint(x: 20.997, y: 19.573))
        //L 19.57, 21.0
        path.addLine(to: CGPoint(x: 19.57, y: 21.0))
        //z 
        //M 17.42, 8.83
        path.move(to: CGPoint(x: 17.42, y: 8.83))
        //l 2.86, -2.86
        path.addLine(to: CGPoint(x: 20.28, y: 5.970000000000001))
        //c -3.95, -3.95, -10.35, -3.96, -14.3, -0.02, 3.93, -1.3, 8.31, -0.25, 11.44, 2.88
        path.addCurve(to: CGPoint(x: 5.98, y: 5.950000000000001), control1: CGPoint(x: 16.330000000000002, y: 2.0200000000000005), control2: CGPoint(x: 9.930000000000001, y: 2.0100000000000007))
        path.addCurve(to: CGPoint(x: 17.42, y: 8.830000000000002), control1: CGPoint(x: 9.91, y: 4.650000000000001), control2: CGPoint(x: 14.290000000000001, y: 5.700000000000001))
        //z 
        //M 5.95, 5.98
        path.move(to: CGPoint(x: 5.95, y: 5.98))
        //c -3.94, 3.95, -3.93, 10.35, 0.02, 14.3
        path.addCurve(to: CGPoint(x: 5.97, y: 20.28), control1: CGPoint(x: 2.0100000000000002, y: 9.93), control2: CGPoint(x: 2.02, y: 16.33))
        //l 2.86, -2.86
        path.addLine(to: CGPoint(x: 8.83, y: 17.42))
        //C 5.7, 14.29, 4.65, 9.91, 5.95, 5.98
        path.addCurve(to: CGPoint(x: 5.95, y: 5.98), control1: CGPoint(x: 5.7, y: 14.29), control2: CGPoint(x: 4.65, y: 9.91))
        //z 
        //M 5.97, 5.96
        path.move(to: CGPoint(x: 5.97, y: 5.96))
        //l -0.01, 0.01
        path.addLine(to: CGPoint(x: 5.96, y: 5.97))
        //c -0.38, 3.01, 1.17, 6.88, 4.3, 10.02
        path.addCurve(to: CGPoint(x: 10.26, y: 15.989999999999998), control1: CGPoint(x: 5.58, y: 8.98), control2: CGPoint(x: 7.13, y: 12.85))
        //l 5.73, -5.73
        path.addLine(to: CGPoint(x: 15.99, y: 10.259999999999998))
        //c -3.13, -3.13, -7.01, -4.68, -10.02, -4.3
        path.addCurve(to: CGPoint(x: 5.970000000000001, y: 5.959999999999998), control1: CGPoint(x: 12.86, y: 7.129999999999998), control2: CGPoint(x: 8.98, y: 5.579999999999998))
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
