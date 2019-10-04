//Automatically created by Kwift
import UIKit
import Kwift

extension ResourcesDrawables {

static func icExposureBlack24dp(view: UIView? = nil) -> CALayer {
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 15.0, 17.0
        path.move(to: CGPoint(x: 15.0, y: 17.0))
        //v 2.0
        path.addLine(to: CGPoint(x: 15.0, y: 19.0))
        //h 2.0
        path.addLine(to: CGPoint(x: 17.0, y: 19.0))
        //v -2.0
        path.addLine(to: CGPoint(x: 17.0, y: 17.0))
        //h 2.0
        path.addLine(to: CGPoint(x: 19.0, y: 17.0))
        //v -2.0
        path.addLine(to: CGPoint(x: 19.0, y: 15.0))
        //h -2.0
        path.addLine(to: CGPoint(x: 17.0, y: 15.0))
        //v -2.0
        path.addLine(to: CGPoint(x: 17.0, y: 13.0))
        //h -2.0
        path.addLine(to: CGPoint(x: 15.0, y: 13.0))
        //v 2.0
        path.addLine(to: CGPoint(x: 15.0, y: 15.0))
        //h -2.0
        path.addLine(to: CGPoint(x: 13.0, y: 15.0))
        //v 2.0
        path.addLine(to: CGPoint(x: 13.0, y: 17.0))
        //h 2.0
        path.addLine(to: CGPoint(x: 15.0, y: 17.0))
        //z 
        //M 20.0, 2.0
        path.move(to: CGPoint(x: 20.0, y: 2.0))
        //L 4.0, 2.0
        path.addLine(to: CGPoint(x: 4.0, y: 2.0))
        //c -1.1, 0.0, -2.0, 0.9, -2.0, 2.0
        path.addCurve(to: CGPoint(x: 2.0, y: 4.0), control1: CGPoint(x: 2.9, y: 2.0), control2: CGPoint(x: 2.0, y: 2.9))
        //v 16.0
        path.addLine(to: CGPoint(x: 2.0, y: 20.0))
        //c 0.0, 1.1, 0.9, 2.0, 2.0, 2.0
        path.addCurve(to: CGPoint(x: 4.0, y: 22.0), control1: CGPoint(x: 2.0, y: 21.1), control2: CGPoint(x: 2.9, y: 22.0))
        //h 16.0
        path.addLine(to: CGPoint(x: 20.0, y: 22.0))
        //c 1.1, 0.0, 2.0, -0.9, 2.0, -2.0
        path.addCurve(to: CGPoint(x: 22.0, y: 20.0), control1: CGPoint(x: 21.1, y: 22.0), control2: CGPoint(x: 22.0, y: 21.1))
        //L 22.0, 4.0
        path.addLine(to: CGPoint(x: 22.0, y: 4.0))
        //c 0.0, -1.1, -0.9, -2.0, -2.0, -2.0
        path.addCurve(to: CGPoint(x: 20.0, y: 2.0), control1: CGPoint(x: 22.0, y: 2.9), control2: CGPoint(x: 21.1, y: 2.0))
        //z 
        //M 5.0, 5.0
        path.move(to: CGPoint(x: 5.0, y: 5.0))
        //h 6.0
        path.addLine(to: CGPoint(x: 11.0, y: 5.0))
        //v 2.0
        path.addLine(to: CGPoint(x: 11.0, y: 7.0))
        //L 5.0, 7.0
        path.addLine(to: CGPoint(x: 5.0, y: 7.0))
        //L 5.0, 5.0
        path.addLine(to: CGPoint(x: 5.0, y: 5.0))
        //z 
        //M 20.0, 20.0
        path.move(to: CGPoint(x: 20.0, y: 20.0))
        //L 4.0, 20.0
        path.addLine(to: CGPoint(x: 4.0, y: 20.0))
        //L 20.0, 4.0
        path.addLine(to: CGPoint(x: 20.0, y: 4.0))
        //v 16.0
        path.addLine(to: CGPoint(x: 20.0, y: 20.0))
        //z 
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFF000000).cgColor
        return sublayer
    }())
    layer.bounds.size = CGSize(width: 24, height: 24)
    return layer
}

}
