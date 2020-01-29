//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps



public class SliderDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Slider Demo"
        }
    }
    public var ratio: StandardObservableProperty<Float>
    public var percent: MutableObservableProperty<Int32>
    public var obsRatingInt: MutableObservableProperty<Int32>
    public var obsRatingFloat: MutableObservableProperty<Float>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = SliderDemoXml()
        var view = xml.setup(dependency)
        xml.slider.bind(0, 100, percent)
        xml.valueDisplay.bindText(percent) { (it) in 
            it.toString()
        }
        xml.rating.bind(5, obsRatingInt)
        xml.ratingDisplayStars.bind(5, obsRatingInt)
        xml.ratingDisplayStarsSmall.bind(5, obsRatingInt)
        xml.ratingDisplayNumber.bindText(obsRatingInt) { (it) in 
            it.toString()
        }
        xml.ratingFloat.bindFloat(5, obsRatingFloat)
        xml.ratingDisplayStarsFloat.bindFloat(5, obsRatingFloat)
        xml.ratingDisplayStarsSmallFloat.bindFloat(5, obsRatingFloat)
        xml.ratingDisplayNumberFloat.bindText(obsRatingFloat) { (it) in 
            it.toString()
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        let ratio: StandardObservableProperty<Float> = StandardObservableProperty(Float(0))
        self.ratio = ratio
        let percent: MutableObservableProperty<Int32> = ratio.transformed(read: { (it) in 
            ( it * 100 ).toInt()
        }, write: { (it) in 
            it.toFloat() / Float(100)
        })
        self.percent = percent
        let obsRatingInt: MutableObservableProperty<Int32> = ratio.transformed(read: { (it) in 
            ( it * 5 ).toInt()
        }, write: { (it) in 
            it.toFloat() / Float(5)
        })
        self.obsRatingInt = obsRatingInt
        let obsRatingFloat: MutableObservableProperty<Float> = ratio.transformed(read: { (it) in 
            it * Float(5)
        }, write: { (it) in 
            it / Float(5)
        })
        self.obsRatingFloat = obsRatingFloat
        super.init()
    }
}
 
