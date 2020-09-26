//! This file will translate using Khrysalis.
///Kotlin Only
@file:Suppress("ConvertToStringTemplate", "RemoveExplicitTypeArguments")

///End Kotlin Only

package com.lightningkite.butterflytemplate.api

import com.lightningkite.butterfly.net.HttpClient
import com.lightningkite.butterfly.net.readJson
import com.lightningkite.butterflytemplate.models.Post
import io.reactivex.Single


class APIOnline(val baseUrl: String = "https://jsonplaceholder.typicode.com") : APIInterface {
    override fun getExamplePosts(): Single<List<Post>> {
        return HttpClient.call(
            url = baseUrl + "/posts",
            method = HttpClient.GET,
            headers = mapOf()
        ).readJson()
    }

}
