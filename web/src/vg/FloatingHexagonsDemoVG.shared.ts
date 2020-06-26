// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: vg/FloatingHexagonsDemoVG.shared.kt
// Package: com.lightningkite.khrysalistemplate.vg
import { Paint } from 'khrysalis/dist/views/draw/Paint.actual'
import { ViewGenerator } from 'khrysalis/dist/views/ViewGenerator.shared'
import { DisplayMetrics } from 'khrysalis/dist/views/DisplayMetrics.actual'
import { RandomInstance } from 'khrysalis/dist/Random.actual'
import { Shader, newLinearGradient } from 'khrysalis/dist/views/draw/LinearGradient.actual'
import { pathFromLTRB } from 'khrysalis/dist/views/draw/Path.actual'
import { CustomViewDelegate } from 'khrysalis/dist/views/CustomViewDelegate.shared'
import { numberToColor } from 'khrysalis/dist/views/Colors.actual'
import { FloatingHexagonsDemoXml } from '../layout/FloatingHexagonsDemoXml'
import { NumberRange } from 'khrysalis/dist/Kotlin'

//! Declares com.lightningkite.khrysalistemplate.vg.FloatingHexagonsDemoVG
export class FloatingHexagonsDemoVG extends ViewGenerator {
    public constructor() {
        super();
    }
    
    
    //! Declares com.lightningkite.khrysalistemplate.vg.FloatingHexagonsDemoVG.title
    public get title(): string { return "Floating Hexagons Test"; }
    
    
    public generate(dependency: Window): HTMLElement {
        const xml = new FloatingHexagonsDemoXml();
        
        const view = xml.setup(dependency);
        
        return view;
    }
}

//! Declares com.lightningkite.khrysalistemplate.vg.FloatingHexagonsDelegate
export class FloatingHexagonsDelegate extends CustomViewDelegate {
    public constructor() {
        super();
        this.backgroundPaint = new Paint();
        this.hexagonPaint = new Paint();
        this.hexagonPaint.strokeWidth = 4;
        this.hexagonPaint.color = numberToColor(0xFFFFFFFF);
        this.location = null;
        this.moveTo = null;
        this.animationTime = 0;
        this.hexagons = null;
        this.backgroundPaint.color = numberToColor(0xFFFFFFFF);
        this.backgroundPaint.textSize = 12;
    }
    
    
    
    public readonly backgroundPaint: Paint;
    
    public readonly hexagonPaint: Paint;
    
    
    public location: (number | null);
    
    public moveTo: (number | null);
    
    public animationTime: number;
    
    
    public hexagons: (Array<Hexagon> | null);
    
    
    public frame(time: number): void {
        let temp_34;
        if ((temp_34 = this.location) !== null) { 
            let temp_35;
            if ((temp_35 = this.moveTo) !== null) { 
                if (Math.abs(temp_34 - temp_35) > .01 && this.animationTime > 0) {
                    const delta = (temp_35 - temp_34) / this.animationTime;
                    
                    const temp45 = this.hexagons;
                    if(temp45 !== null) for(const _x of temp45) { 
                        const it = _x;
                        it.moveX(delta);
                    };
                    this.location = temp_34 + delta;
                    this.animationTime = this.animationTime - time;
                }
            }
        }
    }
    
    
    
    public draw(canvas: CanvasRenderingContext2D, width: number, height: number, displayMetrics: DisplayMetrics): void {
        if (this.hexagons === null) {
            const tempList: Array<Hexagon> = [];
            
            for (const i of new NumberRange(0, 7)) {
                tempList.push(new Hexagon((RandomInstance.random() * width * 1.5), (RandomInstance.random() * height), ((RandomInstance.random() + 0.2) * width / 4), (RandomInstance.random_int31() % (5 - 1) + 1), this.hexagonPaint));
            }
            this.hexagons = Array.from(tempList);
        }
        if (this.location === null) {
            this.location = width / 2;
            this.moveTo = width / 2;
        }
        if (this.backgroundPaint.shader === null) {
            this.backgroundPaint.shader = newLinearGradient(width, 0, 0, height, [numberToColor(0xFF773DBD), numberToColor(0xFF1226AA)], [.25, 1], Shader.TileMode.REPEAT);
        }
        this.backgroundPaint.render(canvas, pathFromLTRB(0, 0, width, height));
        const temp74 = this.hexagons;
        if(temp74 !== null) for(const _x of temp74) { 
            const it = _x;
            it.draw(canvas);
        };
    }
    
    public moveToPos(x: number, time: number): void {
        this.moveTo = x;
        this.animationTime = time;
    }
    
    public onTouchDown(id: number, x: number, y: number, width: number, height: number): boolean {
        this.moveToPos(x, 10);
        return true;
    }
    
    public onTouchMove(id: number, x: number, y: number, width: number, height: number): boolean {
        return true;
    }
    
    public onTouchUp(id: number, x: number, y: number, width: number, height: number): boolean {
        return true;
    }
    
    
    public generateAccessibilityView(): (HTMLElement | null) { return null; }
    
    public sizeThatFitsWidth(width: number, height: number): number {
        return height;
    }
    
    public sizeThatFitsHeight(width: number, height: number): number {
        return width;
    }
}


//! Declares com.lightningkite.khrysalistemplate.vg.Hexagon
export class Hexagon {
    public centerX: number;
    public centerY: number;
    public readonly radius: number;
    public readonly layer: number;
    public readonly paint: Paint;
    public constructor(centerX: number, centerY: number, radius: number, layer: number, paint: Paint) {
        this.centerX = centerX;
        this.centerY = centerY;
        this.radius = radius;
        this.layer = layer;
        this.paint = paint;
        console.log(this.layer);
        this.degreesToRadians = 3.14159 / 180;
    }
    
    
    
    
    public draw(canvas: CanvasRenderingContext2D): void {
        for (const i of new NumberRange(0, 5)) {
            const angle1: number = (i * 60) * this.degreesToRadians;
            
            const angle2: number = (i * 60 + 60) * this.degreesToRadians;
            
            const cornerX1 = Math.sin(angle1) * this.radius + this.centerX;
            
            const cornerY1 = (Math.cos(angle1) * 1.1) * this.radius + this.centerY;
            
            const cornerX2 = Math.sin(angle2) * this.radius + this.centerX;
            
            const cornerY2 = (Math.cos(angle2) * 1.1) * this.radius + this.centerY;
            
            this.paint.alpha = 200 / this.layer;
            const temp118 = canvas;
            temp118.beginPath(); temp118.moveTo(cornerX1, cornerY1); temp118.lineTo(cornerX2, cornerY2); this.paint.complete(temp118);
        }
    }
    
    public move(x: number, y: number): void {
        this.centerX = this.centerX + x / this.layer;
        this.centerY = this.centerY + y / this.layer;
    }
    
    public moveX(x: number): void {
        this.centerX = this.centerX + x / this.layer;
    }
    
    private readonly degreesToRadians: number;
    
}
