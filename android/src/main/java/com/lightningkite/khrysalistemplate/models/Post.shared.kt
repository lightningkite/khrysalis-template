package com.lightningkite.khrysalistemplate.models

import com.lightningkite.khrysalis.Codable

data class Post(
    var userId: Long = 0,
    var id: Long = 0,
    var title: String = "",
    var body: String = ""
): Codable
