package com.lightningkite.khrysalistemplate.api

import com.lightningkite.khrysalis.escaping
import com.lightningkite.khrysalistemplate.models.Post

interface APIInterface {
    //https://jsonplaceholder.typicode.com/posts
    fun getExamplePosts(
        onResult: @escaping() (Int, List<Post>?, String?) -> Unit
    )
}
