import com.lightningkite.khrysalis.gradle.KhrysalisPluginExtension

val packageName = "com.lightningkite.butterflytemplate"

buildscript {
    repositories {
        mavenLocal()
    }
    dependencies {
        classpath("com.lightningkite.khrysalis:plugin:0.1.0")
    }
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("kotlin-android-extensions")
//    id("com.jakeout.gradle-inspector") version "0.3.0"
}

apply(plugin="com.lightningkite.khrysalis")

configure<KhrysalisPluginExtension> {
    projectName = "ButterflyTemplate"
    organizationName = "Lightning Kite"
}

android {
    //    buildToolsVersion = "28.0.3"
    compileSdkVersion(30)
    defaultConfig {
        minSdkVersion(21)
        targetSdkVersion(30)
        multiDexEnabled = true
        applicationId = packageName
        versionCode = 5
        versionName = "1.0.5"
    }
    compileOptions {
        setSourceCompatibility(JavaVersion.VERSION_1_8)
        setTargetCompatibility(JavaVersion.VERSION_1_8)
    }
    buildFeatures {
        viewBinding = true
    }
    packagingOptions {
        exclude("META-INF/**")
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

val kotlin_version = "1.5.30"
dependencies {
    api("com.lightningkite.rx:view-generator:0.0.1")
    api("com.lightningkite.rx:okhttp-resources:0.0.1")
    api("com.lightningkite.khrysalis:jvm-runtime:0.0.1")
    api("com.lightningkite.xmltoxib:safe-insets:0.0.1")
    testImplementation("junit:junit:4.12")
    androidTestImplementation("androidx.test:runner:1.3.0")
    androidTestImplementation("com.android.support.test.espresso:espresso-core:3.0.2")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version")
    implementation("org.jetbrains.kotlin:kotlin-reflect:$kotlin_version")
}


tasks.create("wrapper"){

}
tasks.create("prepareKotlinBuildScriptModel"){

}