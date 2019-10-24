package com.lightningkite.kwifttemplate.shared.views

import android.view.View
import com.lightningkite.kwift.actual.delay
import com.lightningkite.kwift.actual.weak
import com.lightningkite.kwift.observables.actual.bind
import com.lightningkite.kwift.observables.actual.bindLoading
import com.lightningkite.kwift.observables.actual.bindString
import com.lightningkite.kwift.observables.shared.MutableObservableProperty
import com.lightningkite.kwift.observables.shared.ObservableStack
import com.lightningkite.kwift.observables.shared.StandardObservableProperty
import com.lightningkite.kwift.views.actual.ViewDependency
import com.lightningkite.kwift.views.actual.onClick
import com.lightningkite.kwift.views.shared.*
import com.lightningkite.kwifttemplate.R
import com.lightningkite.kwifttemplate.layouts.LoginDemoXml

class LoginDemoVG(stack: ObservableStack<ViewGenerator>) : ViewGenerator() {
    val stack: ObservableStack<ViewGenerator>? by weak(stack)
    override val title: String get() = "Log In Demo"

    val form: Form = Form()
    val username: FormField<String> =
        form.field(R.string.username, "") { field -> field.required() }
    val password: FormField<String> =
        form.field(R.string.password, "") { field -> field.required() }
    val verifyPassword: FormField<String> =
        form.field(R.string.verify_password, "") { field -> field.required() ?: field.matches(password) }
    val agree: FormField<Boolean> =
        form.field(R.string.password, false) { field -> ViewStringResource(R.string.mustAgree).unless(field.value) }
    val loading: MutableObservableProperty<Boolean> = StandardObservableProperty(false)

    override fun generate(dependency: ViewDependency): View {
        val xml = LoginDemoXml()
        val view = xml.setup(dependency)

        xml.username.bindString(username.observable)
        xml.password.bindString(password.observable)
        xml.verifyPassword.bindString(verifyPassword.observable)
        xml.agree.bind(agree.observable)
        xml.submitLoading.bindLoading(loading)
        xml.submit.onClick {
            this.submit()
        }

        return view
    }

    private fun submit() {
        this.form.runOrDialog {
            println("Submit!")
            this.loading.value = true
            delay(1000) {
                this.loading.value = false
                this.stack?.push(ExampleContentVG())
            }
        }
    }
}
