package com.lightningkite.kwift.actuals

fun String.humanify(): String {
    if(this.isEmpty()) return ""
    return this[0].toUpperCase() + this.replace(".", " - ").replace(Regex("[A-Z]")){ result ->
        " " + result.value
    }.replace('_', ' ').trim()
}
