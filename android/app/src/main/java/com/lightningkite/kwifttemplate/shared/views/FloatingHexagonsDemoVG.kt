package com.lightningkite.kwifttemplate.shared.views

import android.graphics.*
import android.util.DisplayMetrics
import android.view.View
import com.lightningkite.kwift.actual.animationFrame
import com.lightningkite.kwift.observables.shared.addWeak
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.asColor
import com.lightningkite.kwift.views.shared.CustomViewDelegate
import com.lightningkite.kwift.views.shared.ViewGenerator
import com.lightningkite.kwifttemplate.layouts.FloatingHexagonsDemoXml
import kotlin.math.abs
import kotlin.math.cos
import kotlin.math.sin

class FloatingHexagonsDemoVG() : ViewGenerator() {

    override val title: String
        get() = "Floating Hexagons Test"

    override fun generate(dependency: ViewDependency): View {
        val xml = FloatingHexagonsDemoXml()
        val view = xml.setup(dependency)
        return view
    }
}

class FloatingHexagonsDelegate : CustomViewDelegate() {


    val backgroundPaint: Paint = Paint()
    val hexagonPaint: Paint = Paint().apply {
        this.strokeWidth = 4f
        color = Color.WHITE
    }
    var location: Float? = null
    var moveTo: Float? = null
    var animationTime: Float = 0f

    var hexagons: List<Hexagon>? = null

    fun frame(time: Float) {
        location?.let { loc ->
            moveTo?.let { moveTo ->
                if (abs(loc - moveTo) > .01f && animationTime > 0) {
                    val delta = (moveTo - loc) / animationTime
                    hexagons?.forEach { it ->
                        it.moveX(delta)
                    }
                    location = loc + delta
                    animationTime -= time
                }
            }
        }
    }

    init {
        this.backgroundPaint.color = 0xFFFFFFFF.asColor()
        this.backgroundPaint.textSize = 12f
        animationFrame.addWeak(this) { self, time ->
            self.frame(time)
            self.postInvalidate()
        }
    }

    override fun draw(canvas: Canvas, width: Float, height: Float, displayMetrics: DisplayMetrics) {
        if (hexagons == null) {
            val tempList: MutableList<Hexagon> = mutableListOf()
            for (i in 0..7) {
                tempList.add(
                    Hexagon(
                        (Random.nextFloat() * width * 1.5f),
                        (Random.nextFloat() * height),
                        ((Random.nextFloat() + 0.2) * width / 4).toFloat(),
                        Random.nextInt(1,5),
                        hexagonPaint
                    )
                )
            }
            hexagons = tempList.toList()
        }
        if (location == null) {
            location = width / 2f
            moveTo = width / 2f
        }
        if (backgroundPaint.shader == null) {
            backgroundPaint.shader = LinearGradient(
                width,
                0f,
                0f,
                height,
                intArrayOf(0xFF773DBD.asColor(), 0xFF1226AA.asColor()),
                floatArrayOf(.25f, 1f),
                Shader.TileMode.REPEAT
            )
        }
        canvas.drawRect(
            0f,
            0f,
            width,
            height,
            backgroundPaint
        )
        hexagons?.forEach { it -> it.draw(canvas) }
    }

    fun moveTo(x: Float, time: Float) {
        moveTo = x
        animationTime = time
    }

    override fun onTouchDown(id: Int, x: Float, y: Float, width: Float, height: Float): Boolean {
        moveTo(x, 10f)
        return true
    }

    override fun onTouchMove(id: Int, x: Float, y: Float, width: Float, height: Float): Boolean {
        return true
    }

    override fun onTouchUp(id: Int, x: Float, y: Float, width: Float, height: Float): Boolean {
        return true
    }


    override fun generateAccessibilityView(): View? = null

    override fun sizeThatFitsWidth(width: Float, height: Float): Float {
        return height
    }

    override fun sizeThatFitsHeight(width: Float, height: Float): Float {
        return width
    }
}


class Hexagon(var centerX: Float, var centerY: Float, val radius: Float, val layer: Int, val paint: Paint) {

    init {
        println(layer)
    }

    fun draw(canvas: Canvas) {
        for (i in 0..5) {
            val angle1: Float = (i * 60f) * degreesToRadians
            val angle2: Float = (i * 60 + 60f) * degreesToRadians
            val cornerX1 = sin(angle1) * radius + centerX
            val cornerY1 = (cos(angle1) * 1.1f) * radius + centerY
            val cornerX2 = sin(angle2) * radius + centerX
            val cornerY2 = (cos(angle2) * 1.1f) * radius + centerY
            paint.alpha = 200 / layer
            canvas.drawLine(cornerX1, cornerY1, cornerX2, cornerY2, paint)
        }
    }

    fun move(x: Float, y: Float) {
        centerX += x / layer
        centerY += y / layer
    }

    fun moveX(x: Float) {
        centerX += x / layer
    }

    private val degreesToRadians: Float = 3.14159f / 180f
}