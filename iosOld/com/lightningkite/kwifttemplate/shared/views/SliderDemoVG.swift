//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation



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
        self.ratio = StandardObservableProperty(0)
        self.percent = ratio.transformed(read: { (it) in 
            ( it * 100 ).toInt()
        }, write: { (it) in 
            it.toFloat() / 100
        })
        self.obsRatingInt = ratio.transformed(read: { (it) in 
            ( it * 5 ).toInt()
        }, write: { (it) in 
            it.toFloat() / 5
        })
        self.obsRatingFloat = ratio.transformed(read: { (it) in 
            it * 5
        }, write: { (it) in 
            it / 5
        })
        super.init()
    }
}
 
