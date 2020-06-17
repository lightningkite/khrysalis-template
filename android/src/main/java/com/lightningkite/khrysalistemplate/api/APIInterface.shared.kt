package com.lightningkite.khrysalistemplate.api

import com.lightningkite.khrysalis.escaping
import com.lightningkite.khrysalistemplate.models.Post
import io.reactivex.Single

interface APIInterface {
    //https://jsonplaceholder.typicode.com/posts
    fun getExamplePosts(): Single<List<Post>>
}
