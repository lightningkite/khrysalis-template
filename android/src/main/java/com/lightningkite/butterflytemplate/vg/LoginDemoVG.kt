//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.vg

import android.view.View
import com.lightningkite.butterfly.Unowned
import com.lightningkite.butterfly.android.ActivityAccess
import com.lightningkite.butterfly.delay
import com.lightningkite.butterfly.observables.MutableObservableProperty
import com.lightningkite.butterfly.observables.ObservableStack
import com.lightningkite.butterfly.observables.StandardObservableProperty
import com.lightningkite.butterfly.observables.binding.bind
import com.lightningkite.butterfly.observables.binding.bindLoading
import com.lightningkite.butterfly.observables.binding.bindString
import com.lightningkite.butterfly.views.*
import com.lightningkite.butterflytemplate.R
import com.lightningkite.butterflytemplate.layouts.LoginDemoXml

class LoginDemoVG(
    @Unowned val stack: ObservableStack<ViewGenerator>
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

    override fun generate(dependency: ActivityAccess): View {
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
                this.stack.push(ExampleContentVG())
            }
        }
    }
}
