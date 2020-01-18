package com.lightningkite.kwifttemplate.vg

import android.graphics.Canvas
import android.graphics.LinearGradient
import android.graphics.Paint
import android.graphics.Shader
import android.util.DisplayMetrics
import android.view.View
import com.lightningkite.kwift.animationFrame
import com.lightningkite.kwift.rx.addWeak
import com.lightningkite.kwift.views.ViewDependency
import com.lightningkite.kwift.views.asColor
import com.lightningkite.kwift.views.draw.drawTextCentered
import com.lightningkite.kwift.views.CustomViewDelegate
import com.lightningkite.kwift.views.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.PongDemoXml
import kotlin.math.abs

class PongDemoVG() : ViewGenerator() {

    override val title: String
        get() = "Pong Test"

    override fun generate(dependency: ViewDependency): View {
        val xml = PongDemoXml()
        val view = xml.setup(dependency)
        return view
    }
}

class PongDelegate : CustomViewDelegate() {
    var ballX: Float = 0f
    var ballY: Float = 0f
    var ballRadius: Float = 5f
    var ballVX: Float = 100f
    var ballVY: Float = 100f
    var stageHalfLength: Float = 100f
    var stageHalfWidth: Float = 50f
    var paddleOffset: Float = 20f
    var paddleHalfThickness: Float = 5f
    var paddleHalfWidth: Float = 10f
    var paddleLeftY: Float = 0f
    var paddleRightY: Float = 0f

    var scoreLeft: Int = 0
    var scoreRight: Int = 0

    fun frame(time: Float) {
        ballX += ballVX * time
        ballY += ballVY * time
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
        if (ballX < -stageHalfLength) {
            ballX = 0f
            ballY = 0f
            ballVX = -ballVX
            scoreRight++
        } else if (ballX > stageHalfLength) {
            ballX = 0f
            ballY = 0f
            ballVX = -ballVX
            scoreLeft++
        }
    }

    val paint: Paint = Paint()

    init {
        this.paint.color = 0xFFFFFFFF.asColor()
        this.paint.textSize = 12f
        animationFrame.addWeak(this){ self, time ->
            self.frame(time)
            self.postInvalidate()
        }
    }

    override fun draw(canvas: Canvas, width: Float, height: Float, displayMetrics: DisplayMetrics) {
        this.width = width
        this.height = height
        if(paint.shader == null){
            paint.shader = LinearGradient(
                0f,
                0f,
                width,
                height,
                intArrayOf(0xFFFF0000.asColor(), 0xFF0000FF.asColor()),
                floatArrayOf(0f, 1f),
                Shader.TileMode.REPEAT
            )
        }
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
        paint.textSize = height / 6f
        canvas.drawTextCentered(
            "$scoreLeft - $scoreRight",
            transformX(0f),
            transformY(-stageHalfWidth/2f),
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

    override fun sizeThatFitsWidth(width: Float, height: Float): Float {
        return height * stageHalfLength / stageHalfWidth
    }
    override fun sizeThatFitsHeight(width: Float, height: Float): Float {
        return width * stageHalfWidth / stageHalfLength
    }
}
