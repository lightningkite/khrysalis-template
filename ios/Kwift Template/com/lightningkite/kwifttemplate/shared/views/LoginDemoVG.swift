//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class LoginDemoVG: ViewGenerator {
    
    
    public weak var stack: ObservableStack<ViewGenerator>? 
    override public var title: String {
        get {
            return "Log In Demo"
        }
    }
    public var form: Form
    public var username: FormField<String>
    public var password: FormField<String>
    public var verifyPassword: FormField<String>
    public var agree: FormField<Bool>
    public var loading: MutableObservableProperty<Bool>
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = LoginDemoXml()
        var view = xml.setup(dependency)
        xml.username.bindString(username.observable)
        xml.password.bindString(password.observable)
        xml.verifyPassword.bindString(verifyPassword.observable)
        xml.agree.bind(agree.observable)
        xml.submitLoading.bindLoading(loading)
        xml.submit.onClick{ () in 
            self.submit()
        }
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    private func submit() -> Void {
        self.form.runOrDialog{ () in 
            print("Submit!")
            self.loading.value = true
            delay(1000) { () in 
                self.loading.value = false
                self.stack?.push(ExampleContentVG())
            }
        }
    }
    
    public init(stack: ObservableStack<ViewGenerator>) {
        self.stack = stack
        let form: Form = Form()
        self.form = form
        let username: FormField<String> = form.field(ResourcesStrings.username, "") { (field) in 
            field.required()
        }
        self.username = username
        let password: FormField<String> = form.field(ResourcesStrings.password, "") { (field) in 
            field.required()
        }
        self.password = password
        let verifyPassword: FormField<String> = form.field(ResourcesStrings.verifyPassword, "") { (field) in 
            field.required() ?? field.matches(password)
        }
        self.verifyPassword = verifyPassword
        let agree: FormField<Bool> = form.field(ResourcesStrings.password, false) { (field) in 
            ViewStringResource(ResourcesStrings.mustAgree).unless(field.value)
        }
        self.agree = agree
        let loading: MutableObservableProperty<Bool> = StandardObservableProperty(false)
        self.loading = loading
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
