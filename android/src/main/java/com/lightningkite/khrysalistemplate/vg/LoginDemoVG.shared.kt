package com.lightningkite.khrysalistemplate.vg

import android.view.View
import com.lightningkite.khrysalis.delay
import com.lightningkite.khrysalis.weak
import com.lightningkite.khrysalis.observables.binding.bind
import com.lightningkite.khrysalis.observables.binding.bindLoading
import com.lightningkite.khrysalis.observables.binding.bindString
import com.lightningkite.khrysalis.observables.MutableObservableProperty
import com.lightningkite.khrysalis.observables.ObservableStack
import com.lightningkite.khrysalis.observables.StandardObservableProperty
import com.lightningkite.khrysalis.unowned
import com.lightningkite.khrysalis.views.ViewDependency
import com.lightningkite.khrysalis.views.onClick
import com.lightningkite.khrysalis.views.*
import com.lightningkite.khrysalistemplate.R
import com.lightningkite.khrysalistemplate.layouts.LoginDemoXml

class LoginDemoVG(
    @unowned val stack: ObservableStack<ViewGenerator>
) : ViewGenerator() {
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
