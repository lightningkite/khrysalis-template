//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.api

import com.lightningkite.butterflytemplate.models.Post
import io.reactivex.Single

interface APIInterface {
    //https://jsonplaceholder.typicode.com/posts
    fun getExamplePosts(): Single<List<Post>>
}
