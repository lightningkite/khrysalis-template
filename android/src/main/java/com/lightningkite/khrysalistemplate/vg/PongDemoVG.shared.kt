package com.lightningkite.khrysalistemplate.vg

import android.graphics.Canvas
import android.graphics.LinearGradient
import android.graphics.Paint
import android.graphics.Shader
import android.util.DisplayMetrics
import android.view.View
import com.lightningkite.khrysalis.animationFrame
import com.lightningkite.khrysalis.rx.addWeak
import com.lightningkite.khrysalis.rx.until
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.asColor
import com.lightningkite.khrysalis.views.draw.drawTextCentered
import com.lightningkite.khrysalis.views.CustomViewDelegate
import com.lightningkite.khrysalis.views.ViewGenerator
import com.lightningkite.khrysalis.views.draw.newLinearGradient
import com.lightningkite.khrysalis.views.geometry.GFloat
import com.lightningkite.khrysalistemplate.layouts.PongDemoXml
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min

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
    var ballX: GFloat = 0f
    var ballY: GFloat = 0f
    var ballRadius: GFloat = 5f
    var ballVX: GFloat = 100f
    var ballVY: GFloat = 100f
    var stageHalfLength: GFloat = 100f
    var stageHalfWidth: GFloat = 50f
    var paddleOffset: GFloat = 20f
    var paddleHalfThickness: GFloat = 5f
    var paddleHalfWidth: GFloat = 10f
    var paddleLeftY: GFloat = 0f
    var paddleRightY: GFloat = 0f

    var scoreLeft: Int = 0
    var scoreRight: Int = 0

    fun frame(time: GFloat) {
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
        animationFrame.subscribe { time: GFloat ->
            this.frame(time)
            this.postInvalidate()
        }.until(removed)
    }

    override fun draw(canvas: Canvas, width: GFloat, height: GFloat, displayMetrics: DisplayMetrics) {
        this.width = width
        this.height = height
        if (paint.shader == null) {
            paint.shader = newLinearGradient(
                0f,
                0f,
                width,
                height,
                listOf(0xFFFF0000.asColor(), 0xFF0000FF.asColor()),
                listOf(0f, 1f),
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
            transformY(-stageHalfWidth / 2f),
            paint
        )
    }

    override fun onTouchDown(id: Int, x: GFloat, y: GFloat, width: GFloat, height: GFloat): Boolean {
        return onTouchUp(id, x, y, width, height)
    }

    override fun onTouchMove(id: Int, x: GFloat, y: GFloat, width: GFloat, height: GFloat): Boolean {
        return onTouchUp(id, x, y, width, height)
    }

    override fun onTouchUp(id: Int, x: GFloat, y: GFloat, width: GFloat, height: GFloat): Boolean {
        if (reverseX(x) < 0) {
            paddleLeftY = reverseY(y)
        } else {
            paddleRightY = reverseY(y)
        }
        return true
    }

    var width: GFloat = 1f
    var height: GFloat = 1f
    fun transformX(x: GFloat): GFloat {
        return (x + stageHalfLength) / (stageHalfLength * 2) * width
    }

    fun transformY(y: GFloat): GFloat {
        return (y + stageHalfWidth) / (stageHalfWidth * 2) * height
    }

    fun reverseX(x: GFloat): GFloat {
        return (x - width / 2) / width * stageHalfLength * 2
    }

    fun reverseY(y: GFloat): GFloat {
        return (y - height / 2) / height * stageHalfWidth * 2
    }

    override fun generateAccessibilityView(): View? = null

    override fun sizeThatFitsWidth(width: GFloat, height: GFloat): GFloat {
        val scale = min(
            (width)/(stageHalfLength),
            (height)/(stageHalfWidth)
        )
        return stageHalfLength * scale
    }

    override fun sizeThatFitsHeight(width: GFloat, height: GFloat): GFloat {
        val scale = min(
            (width)/(stageHalfLength),
            (height)/(stageHalfWidth)
        )
        return stageHalfWidth * scale
    }
}
