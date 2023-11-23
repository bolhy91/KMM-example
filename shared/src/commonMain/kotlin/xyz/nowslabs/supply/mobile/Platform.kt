package xyz.nowslabs.supply.mobile

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform

expect val num: Int