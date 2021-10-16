package com.lightningkite.butterflytemplate

import android.content.Context
import android.os.Bundle
import com.lightningkite.rx.viewgenerators.*
import com.lightningkite.rx.android.resources.*
import com.lightningkite.butterflytemplate.vg.MainVG
import com.lightningkite.rx.android.SpinnerStyleInterceptor
import com.lightningkite.rx.android.staticApplicationContext
import com.lightningkite.rx.okhttp.HttpClient
import com.lightningkite.safeinsets.SafeInsetsInterceptor
import io.github.inflationx.viewpump.ViewPump
import io.github.inflationx.viewpump.ViewPumpContextWrapper
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.schedulers.Schedulers


class MainActivity : ViewGeneratorActivity() {
    companion object {
        val viewData: ViewGenerator by lazy { MainVG() }
    }

    override val main: ViewGenerator
        get() = viewData

    override fun onCreate(savedInstanceState: Bundle?) {
        ViewPump.init(ViewPump.builder()
            .addInterceptor(SafeInsetsInterceptor)
            .addInterceptor(SpinnerStyleInterceptor)
            .addInterceptor(FocusOnStartupInterceptor)
            .build())
        staticApplicationContext = applicationContext
        HttpClient.ioScheduler = Schedulers.io()
        HttpClient.responseScheduler = AndroidSchedulers.mainThread()
        super.onCreate(savedInstanceState)
    }

    override fun attachBaseContext(newBase: Context) {
        super.attachBaseContext(ViewPumpContextWrapper.wrap(newBase))
    }
}
