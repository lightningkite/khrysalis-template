///Kotlin Only
@file:Suppress("ConvertToStringTemplate", "RemoveExplicitTypeArguments")

///End Kotlin Only

package com.lightningkite.khrysalistemplate.api

import com.lightningkite.khrysalis.net.HttpClient
import com.lightningkite.khrysalis.escaping
import com.lightningkite.khrysalis.net.readJson
import com.lightningkite.khrysalistemplate.models.Post
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
