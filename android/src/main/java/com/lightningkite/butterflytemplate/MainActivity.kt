package com.lightningkite.butterflytemplate

import android.os.Bundle
import com.lightningkite.rx.viewgenerators.*
import com.lightningkite.rx.android.resources.*
import com.lightningkite.butterflytemplate.vg.MainVG
import com.lightningkite.rx.android.staticApplicationContext
import com.lightningkite.rx.okhttp.HttpClient
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import io.reactivex.rxjava3.schedulers.Schedulers


class MainActivity : ViewGeneratorActivity() {
    companion object {
        val viewData: ViewGenerator by lazy { MainVG() }
    }

    override val main: ViewGenerator
        get() = viewData

    override fun onCreate(savedInstanceState: Bundle?) {
        staticApplicationContext = applicationContext
        HttpClient.ioScheduler = Schedulers.io()
        HttpClient.responseScheduler = AndroidSchedulers.mainThread()
        super.onCreate(savedInstanceState)
    }
}
