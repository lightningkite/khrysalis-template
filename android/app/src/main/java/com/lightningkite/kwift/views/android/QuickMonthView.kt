package com.lightningkite.kwift.views.android

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.RectF
import android.util.AttributeSet
import android.view.MotionEvent
import android.view.View
import androidx.core.content.ContextCompat
import com.lightningkite.kwifttemplate.R
import java.text.DateFormat
import java.text.DateFormatSymbols
import java.time.DayOfWeek
import java.util.*

open class QuickMonthView : View {

    data class ColorSet(
        val foreground: Int = Color.BLACK,
        val background: Int = Color.WHITE
    )

    private var _firstDay: Calendar = Calendar.getInstance()
    val firstDay: Calendar get() = _firstDay
    var month: Calendar = Calendar.getInstance()
        set(value) {
            value.set(Calendar.DAY_OF_MONTH, 1)
            value.set(Calendar.HOUR_OF_DAY, 0)
            value.set(Calendar.MINUTE, 0)
            value.set(Calendar.SECOND, 0)
            value.set(Calendar.MILLISECOND, 0)
            field = value

            _firstDay.timeInMillis = value.timeInMillis
            val shiftBy = 1 - value.get(Calendar.DAY_OF_WEEK)
            println("Shift by $shiftBy")
            println("Before ${DateFormat.getDateInstance().format(_firstDay.time)}")
            _firstDay.add(Calendar.DAY_OF_MONTH, shiftBy)
            println("After ${DateFormat.getDateInstance().format(_firstDay.time)}")

            invalidate()
        }

    var labelColorSet = ColorSet()
    var defaultColorSet = ColorSet()
    var selectedColorSet = ColorSet(foreground = Color.WHITE, background = Color.RED)
    var labelFontSp: Float = 12f
    var dayFontSp: Float = 16f
    var internalPaddingDp: Float = 8f

    val paint = Paint().apply {
        flags = flags or Paint.ANTI_ALIAS_FLAG
    }

    constructor(context: Context) : super(context) {
        init(context)
    }

    constructor(context: Context, attrs: AttributeSet) : super(context, attrs) {
        init(context, attrs, 0)
    }

    constructor(context: Context, attrs: AttributeSet, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
        init(context, attrs, defStyleAttr)
    }

    var dayLabelHeight: Float = 0f
    private var dayCellHeight: Float = 0f
    private var dayCellWidth: Float = 0f
    private fun measure(context: Context) {
        val internalPadding = context.resources.displayMetrics.density * internalPaddingDp
        paint.textSize = labelFontSp * context.resources.displayMetrics.scaledDensity
        dayLabelHeight = paint.fontMetrics.let { it.descent - it.ascent } + internalPadding * 2
        dayCellWidth = width / 7f
        dayCellHeight = (height - dayLabelHeight) / 5f
    }

    private fun init(context: Context) {
        measure(context)
        month = Calendar.getInstance()
    }

    override fun onSizeChanged(w: Int, h: Int, oldw: Int, oldh: Int) {
        measure(context)
        invalidate()
    }

//    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
//        setMeasuredDimension(
//
//        )
//    }

    private fun init(context: Context, attrs: AttributeSet, defStyleAttr: Int) {
        init(context)
        val a = context.theme.obtainStyledAttributes(attrs, R.styleable.QuickMonthView, defStyleAttr, 0)
        defaultColorSet = ColorSet(
            foreground = a.getColor(R.styleable.QuickMonthView_selectedForegroundColor, Color.BLACK),
            background = a.getColor(R.styleable.QuickMonthView_selectedBackgroundColor, Color.WHITE)
        )
        selectedColorSet = ColorSet(
            foreground = a.getColor(R.styleable.QuickMonthView_defaultForegroundColor, Color.WHITE),
            background = a.getColor(
                R.styleable.QuickMonthView_defaultBackgroundColor,
                ContextCompat.getColor(context, R.color.colorPrimary)
            )
        )
        labelColorSet = ColorSet(
            foreground = a.getColor(R.styleable.QuickMonthView_labelForegroundColor, Color.BLACK),
            background = a.getColor(R.styleable.QuickMonthView_labelBackgroundColor, Color.WHITE)
        )
    }

    var onTouchDown: (Calendar) -> Unit = {
        println("Down on ${DateFormat.getDateInstance().format(it.time)}")
    }
    var onTouchUp: (Calendar) -> Unit = {
        println("Up on ${DateFormat.getDateInstance().format(it.time)}")
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        when (event.actionMasked) {
            MotionEvent.ACTION_DOWN -> {
                onTouchDown(dayAtPixel(event.x, event.y))
            }
            MotionEvent.ACTION_UP -> {
                onTouchUp(dayAtPixel(event.x, event.y))
            }
        }
        return true
    }

    fun dayAtPixel(x: Float, y: Float, out: Calendar = Calendar.getInstance()): Calendar {
        val col = (x / dayCellWidth).toInt()
        val row = ((y - dayLabelHeight) / dayCellHeight).toInt()
        return dayAt(row, col, out)
    }

    fun dayAt(row: Int, column: Int, out: Calendar = Calendar.getInstance()): Calendar {
        out.timeInMillis = firstDay.timeInMillis
        out.add(Calendar.DAY_OF_MONTH, row * 7 + column)
        return out
    }

    val symbols = DateFormatSymbols()
    val forReuse: Calendar = Calendar.getInstance()
    val rectForReuse: RectF = RectF()
    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        drawLabels(canvas)
        for (row in 0..4) {
            for (col in 0..6) {
                val day = dayAt(row, col, forReuse)
                rectForReuse.set(
                    col * dayCellWidth,
                    dayLabelHeight + row * dayCellHeight,
                    (col + 1) * dayCellWidth,
                    dayLabelHeight + (row + 1) * dayCellHeight
                )
                drawDayCell(canvas, rectForReuse, day)
            }
        }
    }

    protected open fun drawDayCell(canvas: Canvas, rectangle: RectF, day: Calendar) {
        paint.apply {
            this.color = defaultColorSet.background
            this.style = Paint.Style.FILL
        }
        canvas.drawRect(rectangle, paint)
        paint.apply {
            this.color = if (day.get(Calendar.MONTH) == month.get(Calendar.MONTH)) {
                defaultColorSet.foreground
            } else {
                Color.argb(
                    Color.alpha(defaultColorSet.foreground) / 2,
                    Color.red(defaultColorSet.foreground),
                    Color.green(defaultColorSet.foreground),
                    Color.blue(defaultColorSet.foreground)
                )
            }

            this.style = Paint.Style.FILL
            this.textSize = dayFontSp * context.resources.displayMetrics.scaledDensity
        }
        canvas.drawTextCentered(
            day.get(Calendar.DAY_OF_MONTH).toString(),
            rectangle.centerX(),
            rectangle.centerY(),
            paint
        )
    }

    protected open fun drawLabels(canvas: Canvas) {
        canvas.drawRect(0f, 0f, width.toFloat(), dayLabelHeight, paint.apply {
            this.color = labelColorSet.background
            this.style = Paint.Style.FILL
        })
        paint.apply {
            this.color = labelColorSet.foreground
            this.style = Paint.Style.FILL
            this.textSize = labelFontSp * context.resources.displayMetrics.scaledDensity
        }
        for (day in DayOfWeek.values()) {
            val text = symbols.shortWeekdays[day.ordinal + 1]
            val left = day.ordinal * dayCellWidth
            val right = (day.ordinal + 1) * dayCellWidth
            val centerX = (left + right) / 2
            val centerY = dayLabelHeight / 2
            canvas.drawTextCentered(text, centerX, centerY, paint)
        }
    }

    fun Canvas.drawTextCentered(text: String, centerX: Float, centerY: Float, paint: Paint) {
        val textWidth = paint.measureText(text)
        val textHeightOffset = (paint.fontMetrics.let { it.ascent + it.descent } / 2)
        drawText(text, centerX - textWidth / 2, centerY - textHeightOffset, paint)
    }
}
