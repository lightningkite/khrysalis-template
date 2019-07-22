package com.lightningkite.kwifttemplate.shared.api

import com.lightningkite.kwift.actuals.Empty
import com.lightningkite.kwift.actuals.ImageData
import com.lightningkite.kwift.actuals.escaping
import com.lightningkite.kwifttemplate.shared.models.*

interface APIInterface {
    //https://jsonplaceholder.typicode.com/posts
    fun getExamplePosts(
        @escaping onResult: (Int, List<Post>?, String?) -> Unit
    )
}
