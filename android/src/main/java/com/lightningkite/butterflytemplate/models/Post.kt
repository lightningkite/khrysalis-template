//! This file will translate using Khrysalis.
package com.lightningkite.butterflytemplate.models

import com.lightningkite.butterfly.Codable

data class Post(
    var userId: Long = 0,
    var id: Long = 0,
    var title: String = "",
    var body: String = ""
): Codable
