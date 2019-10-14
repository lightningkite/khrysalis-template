package com.lightningkite.kwifttemplate.shared.api

import com.lightningkite.kwift.actual.escaping
import com.lightningkite.kwifttemplate.shared.models.Post

interface APIInterface {
    //https://jsonplaceholder.typicode.com/posts
    fun getExamplePosts(
        onResult: @escaping() (Int, List<Post>?, String?) -> Unit
    )
}
