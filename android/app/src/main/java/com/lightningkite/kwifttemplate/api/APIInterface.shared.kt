package com.lightningkite.kwifttemplate.api

import com.lightningkite.kwift.escaping
import com.lightningkite.kwifttemplate.models.Post

interface APIInterface {
    //https://jsonplaceholder.typicode.com/posts
    fun getExamplePosts(
        onResult: @escaping() (Int, List<Post>?, String?) -> Unit
    )
}
