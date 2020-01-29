//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public class FloatingHexagonsDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Floating Hexagons Test"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = FloatingHexagonsDemoXml()
        var view = xml.setup(dependency)
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
 

public class FloatingHexagonsDelegate: CustomViewDelegate {
    
    
    public var backgroundPaint: Paint
    public var hexagonPaint: Paint
    public var location: Float? 
    public var moveTo: Float? 
    public var animationTime: Float
    public var hexagons: Array<Hexagon>? 
    
    public func frame(time: Float) -> Void {
        
        if let loc = (location) {
            
            if let moveTo = (moveTo) {
                if abs(loc - moveTo) > Float(0.01), animationTime > 0 {
                    var delta = ( moveTo - loc ) / animationTime
                    hexagons?.forEach{ (it) in 
                        it.moveX(delta)
                    }
                    location = loc + delta
                    animationTime -= time
                } 
            }
 
        }
    }
    public func frame(_ time: Float) -> Void {
        return frame(time: time)
    }
    
    override public func draw(canvas: Canvas, width: Float, height: Float, displayMetrics: DisplayMetrics) -> Void {
        if hexagons == nil {
            var tempList: Array<Hexagon> = []
            
            for i in 0 ... 7 {
                tempList.add(Hexagon(( Random.nextFloat() * width * Float(1.5) ), ( Random.nextFloat() * height ), ( ( Random.nextFloat() + 0.2 ) * width / 4 ).toFloat(), Random.nextInt(1, 5), hexagonPaint))
            }
            hexagons = tempList.toList()
        }
        if location == nil {
            location = width / Float(2)
            moveTo = width / Float(2)
        }
        if backgroundPaint.shader == nil {
            backgroundPaint.shader = LinearGradient(width, Float(0), Float(0), height, [0xFF773DBD.asColor(), 0xFF1226AA.asColor()], [Float(0.25), Float(1)], Shader.TileMode.REPEAT)
        }
        canvas.drawRect(Float(0), Float(0), width, height, backgroundPaint)
        hexagons?.forEach{ (it) in 
            it.draw(canvas)
        }
    }
    override public func draw(_ canvas: Canvas, _ width: Float, _ height: Float, _ displayMetrics: DisplayMetrics) -> Void {
        return draw(canvas: canvas, width: width, height: height, displayMetrics: displayMetrics)
    }
    
    public func moveTo(x: Float, time: Float) -> Void {
        moveTo = x
        animationTime = time
    }
    public func moveTo(_ x: Float, _ time: Float) -> Void {
        return moveTo(x: x, time: time)
    }
    
    override public func onTouchDown(id: Int32, x: Float, y: Float, width: Float, height: Float) -> Bool {
        moveTo(x, Float(10))
        return true
    }
    override public func onTouchDown(_ id: Int32, _ x: Float, _ y: Float, _ width: Float, _ height: Float) -> Bool {
        return onTouchDown(id: id, x: x, y: y, width: width, height: height)
    }
    
    override public func onTouchMove(id: Int32, x: Float, y: Float, width: Float, height: Float) -> Bool {
        return true
    }
    override public func onTouchMove(_ id: Int32, _ x: Float, _ y: Float, _ width: Float, _ height: Float) -> Bool {
        return onTouchMove(id: id, x: x, y: y, width: width, height: height)
    }
    
    override public func onTouchUp(id: Int32, x: Float, y: Float, width: Float, height: Float) -> Bool {
        return true
    }
    override public func onTouchUp(_ id: Int32, _ x: Float, _ y: Float, _ width: Float, _ height: Float) -> Bool {
        return onTouchUp(id: id, x: x, y: y, width: width, height: height)
    }
    
    override public func generateAccessibilityView() -> View?  {
        return nil
    }
    
    override public func sizeThatFitsWidth(width: Float, height: Float) -> Float {
        return height
    }
    override public func sizeThatFitsWidth(_ width: Float, _ height: Float) -> Float {
        return sizeThatFitsWidth(width: width, height: height)
    }
    
    override public func sizeThatFitsHeight(width: Float, height: Float) -> Float {
        return width
    }
    override public func sizeThatFitsHeight(_ width: Float, _ height: Float) -> Float {
        return sizeThatFitsHeight(width: width, height: height)
    }
    
    override public init() {
        let backgroundPaint: Paint = Paint()
        self.backgroundPaint = backgroundPaint
        let hexagonPaint: Paint = Paint()
        self.hexagonPaint = hexagonPaint
        let location: Float?  = nil
        self.location = location
        let moveTo: Float?  = nil
        self.moveTo = moveTo
        let animationTime: Float = Float(0)
        self.animationTime = animationTime
        let hexagons: Array<Hexagon>?  = nil
        self.hexagons = hexagons
        super.init()
        self.hexagonPaint.strokeWidth = Float(4)
        self.hexagonPaint.color = 0xFFFFFFFF.asColor()
        self.backgroundPaint.color = 0xFFFFFFFF.asColor()
        self.backgroundPaint.textSize = Float(12)
        animationFrame.addWeak(self) { (self, time) in 
            self.frame(time)
            self.postInvalidate()
        }
    }
}
 
 
 

public class Hexagon {
    
    public var centerX: Float
    public var centerY: Float
    public var radius: Float
    public var layer: Int32
    public var paint: Paint
    
    
    public func draw(canvas: Canvas) -> Void {
        
        for i in 0.toInt() ... 5.toInt() {
            var angle1: Float = ( i.toFloat() * Float(60) ) * degreesToRadians
            var angle2: Float = ( i.toFloat() * Float(60) + Float(60) ) * degreesToRadians
            var cornerX1 = sin(angle1) * radius + centerX
            var cornerY1 = ( cos(angle1) * Float(1.1) ) * radius + centerY
            var cornerX2 = sin(angle2) * radius + centerX
            var cornerY2 = ( cos(angle2) * Float(1.1) ) * radius + centerY
            paint.alpha = 200 / layer
            canvas.drawLine(cornerX1, cornerY1, cornerX2, cornerY2, paint)
        }
    }
    public func draw(_ canvas: Canvas) -> Void {
        return draw(canvas: canvas)
    }
    
    public func move(x: Float, y: Float) -> Void {
        centerX += x / layer.toFloat()
        centerY += y / layer.toFloat()
    }
    public func move(_ x: Float, _ y: Float) -> Void {
        return move(x: x, y: y)
    }
    
    public func moveX(x: Float) -> Void {
        centerX += x / layer.toFloat()
    }
    public func moveX(_ x: Float) -> Void {
        return moveX(x: x)
    }
    private var degreesToRadians: Float
    
    public init(centerX: Float, centerY: Float, radius: Float, layer: Int32, paint: Paint) {
        self.centerX = centerX
        self.centerY = centerY
        self.radius = radius
        self.layer = layer
        self.paint = paint
        let degreesToRadians: Float = Float(3.14159) / Float(180)
        self.degreesToRadians = degreesToRadians
        print(layer)
    }
    convenience public init(_ centerX: Float, _ centerY: Float, _ radius: Float, _ layer: Int32, _ paint: Paint) {
        self.init(centerX: centerX, centerY: centerY, radius: radius, layer: layer, paint: paint)
    }
}
 
