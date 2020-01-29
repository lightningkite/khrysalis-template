///Kotlin Only
@file:Suppress("ConvertToStringTemplate", "RemoveExplicitTypeArguments")

///End Kotlin Only

package com.lightningkite.khrysalistemplate.api

import com.lightningkite.khrysalis.net.HttpClient
import com.lightningkite.khrysalis.escaping
import com.lightningkite.khrysalistemplate.models.Post


class APIOnline(val baseUrl: String = "https://jsonplaceholder.typicode.com") : APIInterface {
    override fun getExamplePosts(onResult: @escaping() (Int, List<Post>?, String?) -> Unit) {
        HttpClient.call(
            url = baseUrl + "/posts",
            method = HttpClient.GET,
            headers = mapOf(),
            body = null,
            onResult = onResult
        )
    }

}
