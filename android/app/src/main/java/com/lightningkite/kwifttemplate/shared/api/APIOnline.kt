///Kotlin Only
@file:Suppress("ConvertToStringTemplate", "RemoveExplicitTypeArguments")

///End Kotlin Only

package com.lightningkite.kwifttemplate.shared.api

import com.lightningkite.kwift.actuals.*
import com.lightningkite.kwifttemplate.shared.models.*
import java.util.*


class APIOnline(val baseUrl: String = "https://jsonplaceholder.typicode.com") : APIInterface {
    override fun getExamplePosts(@escaping onResult: (Int, List<Post>?, String?) -> Unit) {
        HttpClient.call(
            url = baseUrl + "/posts",
            method = HttpClient.GET,
            headers = mapOf<String, String>(),
            body = null,
            onResult = onResult
        )
    }

}
