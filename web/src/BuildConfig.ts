//! Declares com.tresitgroup.android.tresit.BuildConfig
export class BuildConfig {
    static INSTANCE = BuildConfig
    static VERSION_NAME: string = "1.0.5"
    static VERSION_CODE: number = 5
    static get DEBUG(): boolean {
        return (window as any).isDebugMode ?? false
    }
}