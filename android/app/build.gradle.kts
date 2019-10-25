import com.lightningkite.kwift.gradle.configureGradle

val packageName = "com.lightningkite.kwifttemplate"

buildscript {
    repositories {
        mavenLocal()
    }
    dependencies {
        classpath("com.lightningkite.kwift:plugin:0.1.0")
    }
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("kotlin-android-extensions")
}

android {
    //    buildToolsVersion = "28.0.3"
    compileSdkVersion(29)
    defaultConfig {
        minSdkVersion(19)
        targetSdkVersion(29)
        applicationId = packageName
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

repositories {
    maven("https://jitpack.io")
    mavenLocal()
}

val kotlin_version = "1.3.41"
dependencies {
    implementation("com.lightningkite.kwift:android:0.1.0")
    testImplementation("junit:junit:4.12")
    androidTestImplementation("androidx.test:runner:1.2.0")
    androidTestImplementation("com.android.support.test.espresso:espresso-core:3.0.2")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version")
    implementation("org.jetbrains.kotlin:kotlin-reflect:$kotlin_version")
    implementation("androidx.appcompat:appcompat:1.1.0")
    implementation("com.google.android.material:material:1.0.0")
    implementation("com.android.support.constraint:constraint-layout:1.1.3")
    implementation("androidx.recyclerview:recyclerview:1.0.0")
    implementation("com.fasterxml.jackson.core:jackson-core:2.9.9")
    implementation("com.fasterxml.jackson.core:jackson-annotations:2.9.7")
    implementation("com.fasterxml.jackson.core:jackson-databind:2.9.9")
    implementation("com.squareup.okhttp3:okhttp:3.12.0")
    implementation("de.hdodenhof:circleimageview:2.2.0")
    implementation("br.com.simplepass:loading-button-android:1.14.0")
    implementation("com.squareup.picasso:picasso:2.71828")
    implementation("com.romandanylyk:pageindicatorview:1.0.3")
    implementation("com.theartofdev.edmodo:android-image-cropper:2.7.0")
    implementation("com.github.marcoscgdev:Android-Week-View:1.2.7")
}

project.configureGradle("../../ios/Kwift Template")

val exampleDeepLink = "exampledeeplink://host/path?query=yes"
tasks.create("testDeepLinkAndroid", Exec::class.java) {
    this.group = "run"
    commandLine(
        android.getAdbExe(),
        "shell",
        "am",
        "start",
        "-a",
        "android.intent.action.VIEW",
        "-d",
        exampleDeepLink,
        packageName
    )
}


tasks.create("testDeepLinkIos", Exec::class.java) {
    this.group = "run"
    commandLine(
        "xcrun",
        "simctl",
        "openurl",
        "booted",
        exampleDeepLink
    )
}
