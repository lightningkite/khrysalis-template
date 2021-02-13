// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: api/APIOnline.kt
// Package: com.lightningkite.butterflytemplate.api
import { Post } from '../models/Post'
import { APIInterface } from './APIInterface'
import { HttpClient } from 'butterfly-web/dist/net/HttpClient'
import { Observable } from 'rxjs'
import { xSingleReadJson } from 'butterfly-web/dist/net/RxHttpAssist'

//! Declares com.lightningkite.butterflytemplate.api.APIOnline
export class APIOnline implements APIInterface {
    public static implementsInterfaceComLightningkiteButterflytemplateApiAPIInterface = true;
    public readonly baseUrl: string;
    public constructor(baseUrl: string = "https://jsonplaceholder.typicode.com") {
        this.baseUrl = baseUrl;
    }
    
    public getExamplePosts(): Observable<Array<Post>> {
        return xSingleReadJson<Array<Post>>(HttpClient.INSTANCE.call(this.baseUrl + "/posts", HttpClient.INSTANCE.GET, new Map([]), undefined, undefined), [Array, [Post]]);
    }
    
}

