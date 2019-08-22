import com.lightningkite.kwift.KwiftSettings
import com.lightningkite.kwift.layoutxml.convertAndroidResourcesToSwift
import com.lightningkite.kwift.layoutxml.createAndroidLayoutClasses
import com.lightningkite.kwift.swift.convertKotlinToSwift

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("kotlin-android-extensions")
    id("com.lightningkite.kwift")
}

android {
    buildToolsVersion = "28.0.3"
    compileSdkVersion(28)
    defaultConfig {
        minSdkVersion(19)
        targetSdkVersion(28)
        applicationId = "com.lightningkite.kwifttemplate"
        versionCode = 5
        versionName = "1.0.5"
    }
    buildTypes {
        //        release {
//            minifyEnabled = false
//            proguardFiles = getDefaultProguardFile("proguard-android.txt"), 'proguard-rules.pro'
//        }
    }
}

val kotlin_version = "1.3.41"
dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version")
    implementation("org.jetbrains.kotlin:kotlin-reflect:$kotlin_version")
    implementation("com.android.support:appcompat-v7:28+")
    implementation("com.android.support.constraint:constraint-layout:1.1.3")
    implementation("com.android.support:recyclerview-v7:28+")
    testImplementation("junit:junit:4.12")
    androidTestImplementation("com.android.support.test:runner:1.0.2")
    androidTestImplementation("com.android.support.test.espresso:espresso-core:3.0.2")
    implementation("com.fasterxml.jackson.core:jackson-core:2.9.9")
    implementation("com.fasterxml.jackson.core:jackson-annotations:2.9.7")
    implementation("com.fasterxml.jackson.core:jackson-databind:2.9.9")
    implementation("com.squareup.okhttp3:okhttp:3.12.0")
    implementation("de.hdodenhof:circleimageview:2.2.0")
    implementation("br.com.simplepass:loading-button-android:1.14.0")
    implementation("com.squareup.picasso:picasso:2.71828")
    api("com.theartofdev.edmodo:android-image-cropper:2.7.+")
}

KwiftSettings.verbose = true

tasks.create("kwift") {
    this.group = "build"
    doLast {
        println("Started")
        convertKotlinToSwift(
            baseKotlin = File("src/main/java/com"),
            baseSwift = File("../../ios/com")
        )
        convertAndroidResourcesToSwift(
            resourcesFolder = File("src/main/res"),
            baseFolderForLocalizations = File("../../ios/localizations"),
            outputFolder = File("../../ios/com/lightningkite/kwifttemplate/xml")
        )
        println("Finished")
    }
}


tasks.create("kwiftXml") {
    this.group = "build"
    doLast {
        println("Started")
        createAndroidLayoutClasses(
            resourcesFolder = File("src/main/res"),
            applicationPackage = "com.lightningkite.kwifttemplate",
            outputFolder = File("src/main/java/com/lightningkite/kwifttemplate/xml")
        )
        println("Finished")
    }
}
