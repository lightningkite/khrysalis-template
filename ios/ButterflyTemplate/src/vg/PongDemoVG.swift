// File: /home/jivie/Projects/khrysalis-template/android/src/main/java/com/lightningkite/butterflytemplate/vg/PongDemoVG.kt
// Package: com.lightningkite.butterflytemplate.vg
// Generated by Khrysalis - this file will be overwritten.
import UIKit
import LKButterfly
import Foundation
import CoreGraphics

public class PongDemoVG : ViewGenerator {
    override public init() {
        super.init()
        //Necessary properties should be initialized now
    }
    
    
    override public var title: String {
        get { return "Pong Test" }
    }
    
    override public func generate(dependency: ViewControllerAccess) -> UIView {
        let xml = PongDemoXml()
        let view = xml.setup(dependency: dependency)
        return view
    }
}

public class PongDelegate : CustomViewDelegate {
    override public init() {
        self.ballX = 0
        self.ballY = 0
        self.ballRadius = 5
        self.ballVX = 100
        self.ballVY = 100
        self.stageHalfLength = 100
        self.stageHalfWidth = 50
        self.paddleOffset = 20
        self.paddleHalfThickness = 5
        self.paddleHalfWidth = 10
        self.paddleLeftY = 0
        self.paddleRightY = 0
        self.scoreLeft = 0
        self.scoreRight = 0
        self.paint = Paint()
        self.width = 1
        self.height = 1
        super.init()
        //Necessary properties should be initialized now
        self.paint.color = UIColor(argb: 0xFFFFFFFF)
        self.paint.textSize = 12
        animationFrame.subscribe(onNext: { (time: CGFloat) -> Void in
            self.frame(time: time)
            self.postInvalidate()
        }, onError: nil, onCompleted: nil).until(condition: self.removed)
    }
    
    public var ballX: CGFloat
    public var ballY: CGFloat
    public var ballRadius: CGFloat
    public var ballVX: CGFloat
    public var ballVY: CGFloat
    public var stageHalfLength: CGFloat
    public var stageHalfWidth: CGFloat
    public var paddleOffset: CGFloat
    public var paddleHalfThickness: CGFloat
    public var paddleHalfWidth: CGFloat
    public var paddleLeftY: CGFloat
    public var paddleRightY: CGFloat
    
    public var scoreLeft: Int
    public var scoreRight: Int
    
    public func frame(time: CGFloat) -> Void {
        self.ballX = self.ballX + self.ballVX * time
        self.ballY = self.ballY + self.ballVY * time
        if self.ballY > self.stageHalfWidth - self.ballRadius {
            self.ballVY = (-abs(self.ballVY))
            self.ballY = self.stageHalfWidth - self.ballRadius
        }
        if self.ballY < (-self.stageHalfWidth) + self.ballRadius {
            self.ballVY = abs(self.ballVY)
            self.ballY = (-self.stageHalfWidth) + self.ballRadius
        }
        if abs(self.ballX - (-(self.stageHalfLength - self.paddleOffset))) < self.paddleHalfThickness + self.ballRadius {
            if abs(self.ballY - self.paddleLeftY) < self.paddleHalfWidth + self.ballRadius {
                self.ballVX = abs(self.ballVX)
            }
        }
        if abs(self.ballX - (self.stageHalfLength - self.paddleOffset)) < self.paddleHalfThickness + self.ballRadius {
            if abs(self.ballY - self.paddleRightY) < self.paddleHalfWidth + self.ballRadius {
                self.ballVX = (-abs(self.ballVX))
            }
        }
        if self.ballX < (-self.stageHalfLength) {
            self.ballX = 0
            self.ballY = 0
            self.ballVX = (-self.ballVX)
            self.scoreRight += 1
        } else { if self.ballX > self.stageHalfLength {
            self.ballX = 0
            self.ballY = 0
            self.ballVX = (-self.ballVX)
            self.scoreLeft += 1
        } }
    }
    
    public let paint: Paint
    
    
    
    override public func draw(canvas: CGContext, width: CGFloat, height: CGFloat, displayMetrics: DisplayMetrics) -> Void {
        self.width = width
        self.height = height
        if self.paint.shader == nil {
            self.paint.shader = newLinearGradient(x0: 0, y0: 0, x1: width, y1: height, colors: [UIColor(argb: 0xFFFF0000), UIColor(argb: 0xFF0000FF)], positions: [0, 1], tile: Shader.TileMode.REPEAT)
        }
        canvas.drawRect(self.transformX(x: (-self.stageHalfLength) + self.paddleOffset - self.paddleHalfThickness), self.transformY(y: self.paddleLeftY - self.paddleHalfWidth), self.transformX(x: (-self.stageHalfLength) + self.paddleOffset + self.paddleHalfThickness), self.transformY(y: self.paddleLeftY + self.paddleHalfWidth), self.paint)
        canvas.drawRect(self.transformX(x: self.stageHalfLength - self.paddleOffset - self.paddleHalfThickness), self.transformY(y: self.paddleRightY - self.paddleHalfWidth), self.transformX(x: self.stageHalfLength - self.paddleOffset + self.paddleHalfThickness), self.transformY(y: self.paddleRightY + self.paddleHalfWidth), self.paint)
        canvas.drawOval(self.transformX(x: self.ballX - self.ballRadius), self.transformY(y: self.ballY - self.ballRadius), self.transformX(x: self.ballX + self.ballRadius), self.transformY(y: self.ballY + self.ballRadius), self.paint)
        self.paint.textSize = height / 6
        canvas.drawTextCentered(text: "\(self.scoreLeft) - \(self.scoreRight)", centerX: self.transformX(x: 0), centerY: self.transformY(y: (-self.stageHalfWidth) / 2), paint: self.paint)
    }
    
    override public func onTouchDown(id: Int, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Bool {
        return self.onTouchUp(id: id, x: x, y: y, width: width, height: height)
    }
    
    override public func onTouchMove(id: Int, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Bool {
        return self.onTouchUp(id: id, x: x, y: y, width: width, height: height)
    }
    
    override public func onTouchUp(id: Int, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Bool {
        if self.reverseX(x: x) < 0 {
            self.paddleLeftY = self.reverseY(y: y)
        } else {
            self.paddleRightY = self.reverseY(y: y)
        }
        return true
    }
    
    public var width: CGFloat
    public var height: CGFloat
    public func transformX(x: CGFloat) -> CGFloat {
        return (x + self.stageHalfLength) / (self.stageHalfLength * 2) * self.width
    }
    
    public func transformY(y: CGFloat) -> CGFloat {
        return (y + self.stageHalfWidth) / (self.stageHalfWidth * 2) * self.height
    }
    
    public func reverseX(x: CGFloat) -> CGFloat {
        return (x - self.width / 2) / self.width * self.stageHalfLength * 2
    }
    
    public func reverseY(y: CGFloat) -> CGFloat {
        return (y - self.height / 2) / self.height * self.stageHalfWidth * 2
    }
    
    override public func generateAccessibilityView() -> UIView? { return nil }
    
    override public func sizeThatFitsWidth(width: CGFloat, height: CGFloat) -> CGFloat {
        let scale = Swift.min((width) / (self.stageHalfLength), (height) / (self.stageHalfWidth))
        return self.stageHalfLength * scale
    }
    
    override public func sizeThatFitsHeight(width: CGFloat, height: CGFloat) -> CGFloat {
        let scale = Swift.min((width) / (self.stageHalfLength), (height) / (self.stageHalfWidth))
        return self.stageHalfWidth * scale
    }
}

