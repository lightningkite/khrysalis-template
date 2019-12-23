package com.lightningkite.kwifttemplate.shared.views

import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.view.View
import com.lightningkite.kwift.actual.delay
import com.lightningkite.kwift.actual.weak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.asColor
import com.lightningkite.kwift.views.shared.CustomViewDelegate
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.PongDemoXml
import kotlin.math.abs

class PongDemoVG() : ViewGenerator() {
    val pong: Delegate = Delegate()
    class Delegate : CustomViewDelegate {
        var ballX: Float = 0f
        var ballY: Float = 0f
        var ballRadius: Float = 5f
        var ballVX: Float = 2f
        var ballVY: Float = 2f
        var stageHalfLength: Float = 100f
        var stageHalfWidth: Float = 50f
        var paddleOffset: Float = 10f
        var paddleHalfThickness: Float = 5f
        var paddleHalfWidth: Float = 10f
        var paddleLeftY: Float = 0f
        var paddleRightY: Float = 0f

        fun frame() {
            ballX += ballVX
            ballY += ballVY
            if (ballY > stageHalfWidth - ballRadius) {
                ballVY = -abs(ballVY)
                ballY = stageHalfWidth - ballRadius
            }
            if (ballY < -stageHalfWidth + ballRadius) {
                ballVY = abs(ballVY)
                ballY = -stageHalfWidth + ballRadius
            }
            if (abs(ballX - -(stageHalfLength - paddleOffset)) < paddleHalfThickness + ballRadius) {
                if (abs(ballY - paddleLeftY) < paddleHalfWidth + ballRadius) {
                    ballVX = abs(ballVX)
                }
            }
            if (abs(ballX - (stageHalfLength - paddleOffset)) < paddleHalfThickness + ballRadius) {
                if (abs(ballY - paddleRightY) < paddleHalfWidth + ballRadius) {
                    ballVX = -abs(ballVX)
                }
            }
            if (ballX < -stageHalfLength || ballX > stageHalfLength) {
                ballX = 0f
                ballY = 0f
                ballVX = -ballVX
            }
        }

        val paint: Paint = Paint()

        init {
            this.paint.color = 0xFFFFFFFF.asColor()
        }

        override fun draw(canvas: Canvas, width: Float, height: Float) {
            this.width = width
            this.height = height
            canvas.drawRect(
                transformX(-stageHalfLength + paddleOffset - paddleHalfThickness),
                transformY(paddleLeftY - paddleHalfWidth),
                transformX(-stageHalfLength + paddleOffset + paddleHalfThickness),
                transformY(paddleLeftY + paddleHalfWidth),
                paint
            )
            canvas.drawRect(
                transformX(stageHalfLength - paddleOffset - paddleHalfThickness),
                transformY(paddleRightY - paddleHalfWidth),
                transformX(stageHalfLength - paddleOffset + paddleHalfThickness),
                transformY(paddleRightY + paddleHalfWidth),
                paint
            )
            canvas.drawOval(
                transformX(ballX - ballRadius),
                transformY(ballY - ballRadius),
                transformX(ballX + ballRadius),
                transformY(ballY + ballRadius),
                paint
            )
        }

        override fun onTouchDown(id: Int, x: Float, y: Float, width: Float, height: Float): Boolean {
            return onTouchUp(id, x, y, width, height)
        }

        override fun onTouchMove(id: Int, x: Float, y: Float, width: Float, height: Float): Boolean {
            return onTouchUp(id, x, y, width, height)
        }

        override fun onTouchUp(id: Int, x: Float, y: Float, width: Float, height: Float): Boolean {
            if (reverseX(x) < 0) {
                paddleLeftY = reverseY(y)
            } else {
                paddleRightY = reverseY(y)
            }
            return true
        }

        var width: Float = 1f
        var height: Float = 1f
        fun transformX(x: Float): Float {
            return (x + stageHalfLength) / (stageHalfLength * 2) * width
        }

        fun transformY(y: Float): Float {
            return (y + stageHalfWidth) / (stageHalfWidth * 2) * height
        }

        fun reverseX(x: Float): Float {
            return (x - width / 2) / width * stageHalfLength * 2
        }

        fun reverseY(y: Float): Float {
            return (y - height / 2) / height * stageHalfWidth * 2
        }

        override fun generateAccessibilityView(): View? = null

    }

    override val title: String
        get() = "Pong Test"

    override fun generate(dependency: ViewDependency): View {
        val xml = PongDemoXml()
        val view = xml.setup(dependency)
        xml.customView.delegate = pong
        xml.customView.setup()
        step(xml.customView)
        return view
    }

    fun step(view: View){
        val weakSelf by weak(this)
        val weakView by weak(view)
        pong.frame()
        view.postInvalidate()
        delay(16){
            weakSelf?.let { self ->
                weakView?.let { view ->
                    self.step(view)
                }
            }
        }
    }
}
