//Package: com.lightningkite.kwifttemplate.shared.views
//Converted using Kwift2

import Foundation



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
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = LoginDemoXml()
        var view = xml.setup(dependency)
        xml.username.bindString(username.observable)
        xml.password.bindString(password.observable)
        xml.verifyPassword.bindString(verifyPassword.observable)
        xml.agree.bind(agree.observable)
        xml.submit.onClick(captureWeak(self) { (self) in 
            var errors = self.form.check()
            if errors.isNotEmpty() {
                showDialog(errors.map{ (it) in 
                    it.string
                }.joinToViewString())
                return
            }
            print("Submit!")
            self.stack?.push(ExampleContentVG())
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    public init(stack: ObservableStack<ViewGenerator>) {
        let stack = stack
        self.stack = stack
        let form = Form()
        self.form = form
        let username = form.field(ResourcesStrings.username, "") { (field) in 
            field.required()
        }
        self.username = username
        let password = form.field(ResourcesStrings.password, "") { (field) in 
            field.required()
        }
        self.password = password
        let verifyPassword = form.field(ResourcesStrings.verifyPassword, "") { (field) in 
            field.required() ?? field.matches(password)
        }
        self.verifyPassword = verifyPassword
        let agree = form.field(ResourcesStrings.password, false) { (field) in 
            ViewStringResource(ResourcesStrings.mustAgree).unless(field.value)
        }
        self.agree = agree
        super.init()
    }
    convenience public init(_ stack: ObservableStack<ViewGenerator>) {
        self.init(stack: stack)
    }
}
 
