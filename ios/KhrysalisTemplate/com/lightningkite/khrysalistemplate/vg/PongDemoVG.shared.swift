//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class PongDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Pong Test"
        }
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = PongDemoXml()
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
 
 

public class PongDelegate: CustomViewDelegate {
    
    
    public var ballX: Float
    public var ballY: Float
    public var ballRadius: Float
    public var ballVX: Float
    public var ballVY: Float
    public var stageHalfLength: Float
    public var stageHalfWidth: Float
    public var paddleOffset: Float
    public var paddleHalfThickness: Float
    public var paddleHalfWidth: Float
    public var paddleLeftY: Float
    public var paddleRightY: Float
    public var scoreLeft: Int32
    public var scoreRight: Int32
    
    public func frame(time: Float) -> Void {
        ballX += ballVX * time
        ballY += ballVY * time
        if ballY > stageHalfWidth - ballRadius {
            ballVY = -abs(ballVY)
            ballY = stageHalfWidth - ballRadius
        }
        if ballY < -stageHalfWidth + ballRadius {
            ballVY = abs(ballVY)
            ballY = -stageHalfWidth + ballRadius
        }
        if abs(ballX - -( stageHalfLength - paddleOffset )) < paddleHalfThickness + ballRadius {
            if abs(ballY - paddleLeftY) < paddleHalfWidth + ballRadius {
                ballVX = abs(ballVX)
            }
        }
        if abs(ballX - ( stageHalfLength - paddleOffset )) < paddleHalfThickness + ballRadius {
            if abs(ballY - paddleRightY) < paddleHalfWidth + ballRadius {
                ballVX = -abs(ballVX)
            }
        }
        if ballX < -stageHalfLength {
            ballX = Float(0)
            ballY = Float(0)
            ballVX = -ballVX
            scoreRight += 1
        } else if ballX > stageHalfLength {
            ballX = Float(0)
            ballY = Float(0)
            ballVX = -ballVX
            scoreLeft += 1
        }
    }
    public func frame(_ time: Float) -> Void {
        return frame(time: time)
    }
    public var paint: Paint
    
    override public func draw(canvas: Canvas, width: Float, height: Float, displayMetrics: DisplayMetrics) -> Void {
        self.width = width
        self.height = height
        if paint.shader == nil {
            paint.shader = newLinearGradient(Float(0), Float(0), width, height, [0xFFFF0000.asColor(), 0xFF0000FF.asColor()], [Float(0), Float(1)], Shader.TileMode.REPEAT)
        }
        canvas.drawRect(transformX(-stageHalfLength + paddleOffset - paddleHalfThickness), transformY(paddleLeftY - paddleHalfWidth), transformX(-stageHalfLength + paddleOffset + paddleHalfThickness), transformY(paddleLeftY + paddleHalfWidth), paint)
        canvas.drawRect(transformX(stageHalfLength - paddleOffset - paddleHalfThickness), transformY(paddleRightY - paddleHalfWidth), transformX(stageHalfLength - paddleOffset + paddleHalfThickness), transformY(paddleRightY + paddleHalfWidth), paint)
        canvas.drawOval(transformX(ballX - ballRadius), transformY(ballY - ballRadius), transformX(ballX + ballRadius), transformY(ballY + ballRadius), paint)
        paint.textSize = height / Float(6)
        canvas.drawTextCentered("\(scoreLeft) - \(scoreRight)", transformX(Float(0)), transformY(-stageHalfWidth / Float(2)), paint)
    }
    override public func draw(_ canvas: Canvas, _ width: Float, _ height: Float, _ displayMetrics: DisplayMetrics) -> Void {
        return draw(canvas: canvas, width: width, height: height, displayMetrics: displayMetrics)
    }
    
    override public func onTouchDown(id: Int32, x: Float, y: Float, width: Float, height: Float) -> Bool {
        return onTouchUp(id, x, y, width, height)
    }
    override public func onTouchDown(_ id: Int32, _ x: Float, _ y: Float, _ width: Float, _ height: Float) -> Bool {
        return onTouchDown(id: id, x: x, y: y, width: width, height: height)
    }
    
    override public func onTouchMove(id: Int32, x: Float, y: Float, width: Float, height: Float) -> Bool {
        return onTouchUp(id, x, y, width, height)
    }
    override public func onTouchMove(_ id: Int32, _ x: Float, _ y: Float, _ width: Float, _ height: Float) -> Bool {
        return onTouchMove(id: id, x: x, y: y, width: width, height: height)
    }
    
    override public func onTouchUp(id: Int32, x: Float, y: Float, width: Float, height: Float) -> Bool {
        if reverseX(x) < 0 {
            paddleLeftY = reverseY(y)
        } else {
            paddleRightY = reverseY(y)
        }
        return true
    }
    override public func onTouchUp(_ id: Int32, _ x: Float, _ y: Float, _ width: Float, _ height: Float) -> Bool {
        return onTouchUp(id: id, x: x, y: y, width: width, height: height)
    }
    public var width: Float
    public var height: Float
    
    public func transformX(x: Float) -> Float {
        return ( x + stageHalfLength ) / ( stageHalfLength * 2 ) * width
    }
    public func transformX(_ x: Float) -> Float {
        return transformX(x: x)
    }
    
    public func transformY(y: Float) -> Float {
        return ( y + stageHalfWidth ) / ( stageHalfWidth * 2 ) * height
    }
    public func transformY(_ y: Float) -> Float {
        return transformY(y: y)
    }
    
    public func reverseX(x: Float) -> Float {
        return ( x - width / 2 ) / width * stageHalfLength * 2
    }
    public func reverseX(_ x: Float) -> Float {
        return reverseX(x: x)
    }
    
    public func reverseY(y: Float) -> Float {
        return ( y - height / 2 ) / height * stageHalfWidth * 2
    }
    public func reverseY(_ y: Float) -> Float {
        return reverseY(y: y)
    }
    
    override public func generateAccessibilityView() -> View?  {
        return nil
    }
    
    override public func sizeThatFitsWidth(width: Float, height: Float) -> Float {
        return height * stageHalfLength / stageHalfWidth
    }
    override public func sizeThatFitsWidth(_ width: Float, _ height: Float) -> Float {
        return sizeThatFitsWidth(width: width, height: height)
    }
    
    override public func sizeThatFitsHeight(width: Float, height: Float) -> Float {
        return width * stageHalfWidth / stageHalfLength
    }
    override public func sizeThatFitsHeight(_ width: Float, _ height: Float) -> Float {
        return sizeThatFitsHeight(width: width, height: height)
    }
    
    override public init() {
        let ballX: Float = Float(0)
        self.ballX = ballX
        let ballY: Float = Float(0)
        self.ballY = ballY
        let ballRadius: Float = Float(5)
        self.ballRadius = ballRadius
        let ballVX: Float = Float(100)
        self.ballVX = ballVX
        let ballVY: Float = Float(100)
        self.ballVY = ballVY
        let stageHalfLength: Float = Float(100)
        self.stageHalfLength = stageHalfLength
        let stageHalfWidth: Float = Float(50)
        self.stageHalfWidth = stageHalfWidth
        let paddleOffset: Float = Float(20)
        self.paddleOffset = paddleOffset
        let paddleHalfThickness: Float = Float(5)
        self.paddleHalfThickness = paddleHalfThickness
        let paddleHalfWidth: Float = Float(10)
        self.paddleHalfWidth = paddleHalfWidth
        let paddleLeftY: Float = Float(0)
        self.paddleLeftY = paddleLeftY
        let paddleRightY: Float = Float(0)
        self.paddleRightY = paddleRightY
        let scoreLeft: Int32 = 0
        self.scoreLeft = scoreLeft
        let scoreRight: Int32 = 0
        self.scoreRight = scoreRight
        let paint: Paint = Paint()
        self.paint = paint
        let width: Float = Float(1)
        self.width = width
        let height: Float = Float(1)
        self.height = height
        super.init()
        self.paint.color = 0xFFFFFFFF.asColor()
        self.paint.textSize = Float(12)
        animationFrame.addWeak(self){ (self, time) in 
            self.frame(time)
            self.postInvalidate()
        }
    }
}
 
