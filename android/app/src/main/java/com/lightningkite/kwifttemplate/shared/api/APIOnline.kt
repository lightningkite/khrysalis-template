///Kotlin Only
@file:Suppress("ConvertToStringTemplate", "RemoveExplicitTypeArguments")

///End Kotlin Only

package com.lightningkite.kwifttemplate.shared.api

import com.lightningkite.kwift.actuals.HttpClient
import com.lightningkite.kwift.actuals.escaping
import com.lightningkite.kwifttemplate.shared.models.Post


class APIOnline(val baseUrl: String = "https://jsonplaceholder.typicode.com") : APIInterface {
    override fun getExamplePosts(onResult: @escaping() (Int, List<Post>?, String?) -> Unit) {
        HttpClient.call(
            url = baseUrl + "/posts",
            method = HttpClient.GET,
            headers = mapOf<String, String>(),
            body = null,
            onResult = onResult
        )
    }

}
