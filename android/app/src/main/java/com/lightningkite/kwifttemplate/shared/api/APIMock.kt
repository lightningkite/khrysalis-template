package com.lightningkite.kwifttemplate.shared.api

import com.lightningkite.kwift.actuals.delay
import com.lightningkite.kwift.actuals.escaping
import com.lightningkite.kwifttemplate.shared.models.Post

class APIMock() : APIInterface {

    companion object {
        var delayMs: Long = 150
        val lorem =
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    }

    override fun getExamplePosts(onResult: @escaping() (Int, List<Post>?, String?) -> Unit) {
        delay(APIMock.delayMs){
            onResult(200, listOf(Post(title = "First", body = APIMock.lorem)), null)
        }
    }
}
