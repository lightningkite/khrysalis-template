// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: api/APIInterface.shared.kt
// Package: com.lightningkite.khrysalistemplate.api
// FQImport: com.lightningkite.khrysalistemplate.models.Post TS Post
import { Post } from '../models/Post.shared'
import { Observable } from 'rxjs'

//! Declares com.lightningkite.khrysalistemplate.api.APIInterface
export interface APIInterface {
    
    getExamplePosts(): Observable<Array<Post>> 
}


