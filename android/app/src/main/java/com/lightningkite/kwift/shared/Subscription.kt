package com.lightningkite.kwift.shared

import com.lightningkite.kwift.actuals.escaping

class Subscription<T>(
    @escaping val listener: (T) -> Boolean,
    val identifier: Int = 0
)
