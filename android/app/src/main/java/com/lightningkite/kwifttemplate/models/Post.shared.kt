package com.lightningkite.kwifttemplate.models

import com.lightningkite.kwift.Codable

data class Post(
    var userId: Long = 0,
    var id: Long = 0,
    var title: String = "",
    var body: String = ""
): Codable
