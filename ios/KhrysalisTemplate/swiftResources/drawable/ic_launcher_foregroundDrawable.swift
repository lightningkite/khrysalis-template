//Automatically created by Khrysalis
import UIKit
import Khrysalis

extension R.drawable {

static let ic_launcher_foreground: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let scaleX: CGFloat = CGFloat(108.0) / 108.0
    let scaleY: CGFloat = CGFloat(108.0) / 108.0
    let layer = CALayer()
    layer.addSublayer({
        let mask = CAShapeLayer()
        let path = CGMutablePath()
        //M 32.0, 64.0
        path.move(to: CGPoint(x: 32.0 * scaleX, y: 64.0 * scaleY))
        //C 32.0, 64.0, 38.39, 52.99, 44.13, 50.95
        path.addCurve(to: CGPoint(x: 44.13 * scaleX, y: 50.95 * scaleY), control1: CGPoint(x: 32.0 * scaleX, y: 64.0 * scaleY), control2: CGPoint(x: 38.39 * scaleX, y: 52.99 * scaleY))
        //C 51.37, 48.37, 70.14, 49.57, 70.14, 49.57
        path.addCurve(to: CGPoint(x: 70.14 * scaleX, y: 49.57 * scaleY), control1: CGPoint(x: 51.37 * scaleX, y: 48.37 * scaleY), control2: CGPoint(x: 70.14 * scaleX, y: 49.57 * scaleY))
        //L 108.26, 87.69
        path.addLine(to: CGPoint(x: 108.26 * scaleX, y: 87.69 * scaleY))
        //L 108.0, 109.01
        path.addLine(to: CGPoint(x: 108.0 * scaleX, y: 109.01 * scaleY))
        //L 75.97, 107.97
        path.addLine(to: CGPoint(x: 75.97 * scaleX, y: 107.97 * scaleY))
        //L 32.0, 64.0
        path.addLine(to: CGPoint(x: 32.0 * scaleX, y: 64.0 * scaleY))
        //Z 
        mask.path = path
        let gradient = CAGradientLayer()
        gradient.mask = mask
        gradient.startPoint = CGPoint(x: 0.4515305555555556, y: 0.5656731481481482)
        gradient.endPoint = CGPoint(x: 0.7276712962962962, y: 0.8418138888888889)
        gradient.colors = [UIColor(argb: 0x44000000).cgColor, UIColor(argb: 0x00000000).cgColor]
        gradient.frame = CGRect(x: 0, y: 0, width: 108.0, height: 108.0)
        return gradient
    }())
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 66.94, 46.02
        path.move(to: CGPoint(x: 66.94 * scaleX, y: 46.02 * scaleY))
        //L 66.94, 46.02
        path.addLine(to: CGPoint(x: 66.94 * scaleX, y: 46.02 * scaleY))
        //C 72.44, 50.07, 76.0, 56.61, 76.0, 64.0
        path.addCurve(to: CGPoint(x: 76.0 * scaleX, y: 64.0 * scaleY), control1: CGPoint(x: 72.44 * scaleX, y: 50.07 * scaleY), control2: CGPoint(x: 76.0 * scaleX, y: 56.61 * scaleY))
        //L 32.0, 64.0
        path.addLine(to: CGPoint(x: 32.0 * scaleX, y: 64.0 * scaleY))
        //C 32.0, 56.61, 35.56, 50.11, 40.98, 46.06
        path.addCurve(to: CGPoint(x: 40.98 * scaleX, y: 46.06 * scaleY), control1: CGPoint(x: 32.0 * scaleX, y: 56.61 * scaleY), control2: CGPoint(x: 35.56 * scaleX, y: 50.11 * scaleY))
        //L 36.18, 41.19
        path.addLine(to: CGPoint(x: 36.18 * scaleX, y: 41.19 * scaleY))
        //C 35.45, 40.45, 35.45, 39.3, 36.18, 38.56
        path.addCurve(to: CGPoint(x: 36.18 * scaleX, y: 38.56 * scaleY), control1: CGPoint(x: 35.45 * scaleX, y: 40.45 * scaleY), control2: CGPoint(x: 35.45 * scaleX, y: 39.3 * scaleY))
        //C 36.91, 37.81, 38.05, 37.81, 38.78, 38.56
        path.addCurve(to: CGPoint(x: 38.78 * scaleX, y: 38.56 * scaleY), control1: CGPoint(x: 36.91 * scaleX, y: 37.81 * scaleY), control2: CGPoint(x: 38.05 * scaleX, y: 37.81 * scaleY))
        //L 44.25, 44.05
        path.addLine(to: CGPoint(x: 44.25 * scaleX, y: 44.05 * scaleY))
        //C 47.18, 42.57, 50.48, 41.71, 54.0, 41.71
        path.addCurve(to: CGPoint(x: 54.0 * scaleX, y: 41.71 * scaleY), control1: CGPoint(x: 47.18 * scaleX, y: 42.57 * scaleY), control2: CGPoint(x: 50.48 * scaleX, y: 41.71 * scaleY))
        //C 57.48, 41.71, 60.78, 42.57, 63.68, 44.05
        path.addCurve(to: CGPoint(x: 63.68 * scaleX, y: 44.05 * scaleY), control1: CGPoint(x: 57.48 * scaleX, y: 41.71 * scaleY), control2: CGPoint(x: 60.78 * scaleX, y: 42.57 * scaleY))
        //L 69.11, 38.56
        path.addLine(to: CGPoint(x: 69.11 * scaleX, y: 38.56 * scaleY))
        //C 69.84, 37.81, 70.98, 37.81, 71.71, 38.56
        path.addCurve(to: CGPoint(x: 71.71 * scaleX, y: 38.56 * scaleY), control1: CGPoint(x: 69.84 * scaleX, y: 37.81 * scaleY), control2: CGPoint(x: 70.98 * scaleX, y: 37.81 * scaleY))
        //C 72.44, 39.3, 72.44, 40.45, 71.71, 41.19
        path.addCurve(to: CGPoint(x: 71.71 * scaleX, y: 41.19 * scaleY), control1: CGPoint(x: 72.44 * scaleX, y: 39.3 * scaleY), control2: CGPoint(x: 72.44 * scaleX, y: 40.45 * scaleY))
        //L 66.94, 46.02
        path.addLine(to: CGPoint(x: 66.94 * scaleX, y: 46.02 * scaleY))
        //Z 
        //M 62.94, 56.92
        path.move(to: CGPoint(x: 62.94 * scaleX, y: 56.92 * scaleY))
        //C 64.08, 56.92, 65.0, 56.01, 65.0, 54.88
        path.addCurve(to: CGPoint(x: 65.0 * scaleX, y: 54.88 * scaleY), control1: CGPoint(x: 64.08 * scaleX, y: 56.92 * scaleY), control2: CGPoint(x: 65.0 * scaleX, y: 56.01 * scaleY))
        //C 65.0, 53.76, 64.08, 52.85, 62.94, 52.85
        path.addCurve(to: CGPoint(x: 62.94 * scaleX, y: 52.85 * scaleY), control1: CGPoint(x: 65.0 * scaleX, y: 53.76 * scaleY), control2: CGPoint(x: 64.08 * scaleX, y: 52.85 * scaleY))
        //C 61.8, 52.85, 60.88, 53.76, 60.88, 54.88
        path.addCurve(to: CGPoint(x: 60.88 * scaleX, y: 54.88 * scaleY), control1: CGPoint(x: 61.8 * scaleX, y: 52.85 * scaleY), control2: CGPoint(x: 60.88 * scaleX, y: 53.76 * scaleY))
        //C 60.88, 56.01, 61.8, 56.92, 62.94, 56.92
        path.addCurve(to: CGPoint(x: 62.94 * scaleX, y: 56.92 * scaleY), control1: CGPoint(x: 60.88 * scaleX, y: 56.01 * scaleY), control2: CGPoint(x: 61.8 * scaleX, y: 56.92 * scaleY))
        //Z 
        //M 45.06, 56.92
        path.move(to: CGPoint(x: 45.06 * scaleX, y: 56.92 * scaleY))
        //C 46.2, 56.92, 47.13, 56.01, 47.13, 54.88
        path.addCurve(to: CGPoint(x: 47.13 * scaleX, y: 54.88 * scaleY), control1: CGPoint(x: 46.2 * scaleX, y: 56.92 * scaleY), control2: CGPoint(x: 47.13 * scaleX, y: 56.01 * scaleY))
        //C 47.13, 53.76, 46.2, 52.85, 45.06, 52.85
        path.addCurve(to: CGPoint(x: 45.06 * scaleX, y: 52.85 * scaleY), control1: CGPoint(x: 47.13 * scaleX, y: 53.76 * scaleY), control2: CGPoint(x: 46.2 * scaleX, y: 52.85 * scaleY))
        //C 43.92, 52.85, 43.0, 53.76, 43.0, 54.88
        path.addCurve(to: CGPoint(x: 43.0 * scaleX, y: 54.88 * scaleY), control1: CGPoint(x: 43.92 * scaleX, y: 52.85 * scaleY), control2: CGPoint(x: 43.0 * scaleX, y: 53.76 * scaleY))
        //C 43.0, 56.01, 43.92, 56.92, 45.06, 56.92
        path.addCurve(to: CGPoint(x: 45.06 * scaleX, y: 56.92 * scaleY), control1: CGPoint(x: 43.0 * scaleX, y: 56.01 * scaleY), control2: CGPoint(x: 43.92 * scaleX, y: 56.92 * scaleY))
        //Z 
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFFFFFFFF).cgColor
        sublayer.strokeColor = UIColor(argb: 0x00000000).cgColor
        sublayer.lineWidth = 1.0 * scaleX
        return sublayer
    }())
    layer.bounds.size = CGSize(width: 108.0, height: 108.0)
    layer.scaleOverResize = true
    return layer
}

}
