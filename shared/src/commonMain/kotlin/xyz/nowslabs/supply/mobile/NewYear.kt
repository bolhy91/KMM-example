package xyz.nowslabs.supply.mobile

import kotlinx.datetime.Clock
import kotlinx.datetime.LocalDate
import kotlinx.datetime.TimeZone
import kotlinx.datetime.daysUntil
import kotlinx.datetime.todayIn

fun daysUntilNewYear() : Int {
    val today = Clock.System.todayIn(TimeZone.currentSystemDefault())
    val closetNewYear = LocalDate(today.year + 1, 1, 1)
    return today.daysUntil(closetNewYear)
}