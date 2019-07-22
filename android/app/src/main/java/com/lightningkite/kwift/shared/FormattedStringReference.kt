package com.lightningkite.kwift.shared

import com.lightningkite.kwift.actuals.StringReference

data class FormattedStringReference(
    val reference: StringReference,
    val arguments: List<String>
) {
}
