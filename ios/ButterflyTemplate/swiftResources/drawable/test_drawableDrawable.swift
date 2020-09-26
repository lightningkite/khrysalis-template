//Automatically created by Khrysalis
import UIKit
import Butterfly

extension R.drawable {

static let test_drawable: Drawable = Drawable { (view: UIView?) -> CALayer in 
    let scaleX: CGFloat = CGFloat(34.356) / 34.356
    let scaleY: CGFloat = CGFloat(33.518) / 33.518
    let layer = CALayer()
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 16.759, 0.0
        path.move(to: CGPoint(x: 16.759 * scaleX, y: 0.0 * scaleY))
        //H 17.6
        path.addLine(to: CGPoint(x: 17.6 * scaleX, y: 0.0 * scaleY))
        //a 16.759, 16.759, 0.0, 0.0, 1.0, 0.0, 33.518
        path.arcTo(radius: CGSize(width: 16.759 * scaleX, height: 16.759 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 17.6 * scaleX, y: 33.518 * scaleY))
        //h -0.838
        path.addLine(to: CGPoint(x: 16.762 * scaleX, y: 33.518 * scaleY))
        //A 16.759, 16.759, 0.0, 0.0, 1.0, 16.759, 0.0
        path.arcTo(radius: CGSize(width: 16.759 * scaleX, height: 16.759 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 16.759 * scaleX, y: 0.0 * scaleY))
        //Z 
        path.closeSubpath()
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFF285197).cgColor
        return sublayer
    }())
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 24.489, 22.366
        path.move(to: CGPoint(x: 24.489 * scaleX, y: 22.366 * scaleY))
        //h -14.0
        path.addLine(to: CGPoint(x: 10.489 * scaleX, y: 22.366 * scaleY))
        //A 0.23, 0.23, 0.0, 0.0, 1.0, 10.259, 22.134
        path.arcTo(radius: CGSize(width: 0.23 * scaleX, height: 0.23 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 10.259 * scaleX, y: 22.134 * scaleY))
        //L 10.259, 11.066
        path.addLine(to: CGPoint(x: 10.259 * scaleX, y: 11.066 * scaleY))
        //A 0.23, 0.23, 0.0, 0.0, 1.0, 10.488, 10.834
        path.arcTo(radius: CGSize(width: 0.23 * scaleX, height: 0.23 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 10.488 * scaleX, y: 10.834 * scaleY))
        //h 14.0
        path.addLine(to: CGPoint(x: 24.488 * scaleX, y: 10.834 * scaleY))
        //a 0.23, 0.23, 0.0, 0.0, 1.0, 0.229, 0.232
        path.arcTo(radius: CGSize(width: 0.23 * scaleX, height: 0.23 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 24.717 * scaleX, y: 11.065999999999999 * scaleY))
        //L 24.717, 22.134
        path.addLine(to: CGPoint(x: 24.717 * scaleX, y: 22.134 * scaleY))
        //A 0.23, 0.23, 0.0, 0.0, 1.0, 24.489, 22.366
        path.arcTo(radius: CGSize(width: 0.23 * scaleX, height: 0.23 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 24.489 * scaleX, y: 22.366 * scaleY))
        //Z 
        //M 20.126, 17.191
        path.move(to: CGPoint(x: 20.126 * scaleX, y: 17.191 * scaleY))
        //a 0.092, 0.092, 0.0, 0.0, 1.0, 0.067, 0.029
        path.arcTo(radius: CGSize(width: 0.092 * scaleX, height: 0.092 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 20.193 * scaleX, y: 17.22 * scaleY))
        //l 3.15, 3.3
        path.addLine(to: CGPoint(x: 23.343 * scaleX, y: 20.52 * scaleY))
        //L 23.343, 12.224
        path.addLine(to: CGPoint(x: 23.343 * scaleX, y: 12.224 * scaleY))
        //L 11.634, 12.224
        path.addLine(to: CGPoint(x: 11.634 * scaleX, y: 12.224 * scaleY))
        //L 11.634, 20.168
        path.addLine(to: CGPoint(x: 11.634 * scaleX, y: 20.168 * scaleY))
        //l 3.3, -4.483
        path.addLine(to: CGPoint(x: 14.934000000000001 * scaleX, y: 15.684999999999999 * scaleY))
        //a 0.094, 0.094, 0.0, 0.0, 1.0, 0.073, -0.038, 0.093, 0.093, 0.0, 0.0, 1.0, 0.075, 0.035
        path.arcTo(radius: CGSize(width: 0.094 * scaleX, height: 0.094 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 15.007000000000001 * scaleX, y: 15.646999999999998 * scaleY))
        path.arcTo(radius: CGSize(width: 0.093 * scaleX, height: 0.093 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 15.082 * scaleX, y: 15.681999999999999 * scaleY))
        //L 17.878, 19.16, 20.059, 17.215
        path.addLine(to: CGPoint(x: 17.878 * scaleX, y: 19.16 * scaleY))
        path.addLine(to: CGPoint(x: 20.059 * scaleX, y: 17.215 * scaleY))
        //A 0.093, 0.093, 0.0, 0.0, 1.0, 20.126, 17.191
        path.arcTo(radius: CGSize(width: 0.093 * scaleX, height: 0.093 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: true, end: CGPoint(x: 20.126 * scaleX, y: 17.191 * scaleY))
        //Z 
        path.closeSubpath()
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFFffffff).cgColor
        return sublayer
    }())
    layer.addSublayer({
        let sublayer = CAShapeLayer()
        let path = CGMutablePath()
        //M 20.007, 15.103
        path.move(to: CGPoint(x: 20.007 * scaleX, y: 15.103 * scaleY))
        //A 0.813, 0.813, 0.0, 0.0, 0.0, 20.815, 14.285, 0.814, 0.814, 0.0, 0.0, 0.0, 20.007, 13.467, 0.813, 0.813, 0.0, 0.0, 0.0, 19.198, 14.285, 0.813, 0.813, 0.0, 0.0, 0.0, 20.007, 15.103
        path.arcTo(radius: CGSize(width: 0.813 * scaleX, height: 0.813 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 20.815 * scaleX, y: 14.285 * scaleY))
        path.arcTo(radius: CGSize(width: 0.814 * scaleX, height: 0.814 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 20.007 * scaleX, y: 13.467 * scaleY))
        path.arcTo(radius: CGSize(width: 0.813 * scaleX, height: 0.813 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 19.198 * scaleX, y: 14.285 * scaleY))
        path.arcTo(radius: CGSize(width: 0.813 * scaleX, height: 0.813 * scaleY), rotation: 0.0, largeArcFlag: false, sweepFlag: false, end: CGPoint(x: 20.007 * scaleX, y: 15.103 * scaleY))
        //Z 
        path.closeSubpath()
        sublayer.path = path
        sublayer.fillColor = UIColor(argb: 0xFFffffff).cgColor
        return sublayer
    }())
    layer.bounds.size = CGSize(width: 34.356, height: 33.518)
    layer.scaleOverResize = true
    return layer
}

}
