// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: models/Post.kt
// Package: com.lightningkite.butterflytemplate.models
import { hashAnything, safeEq } from 'butterfly-web/dist/Kotlin'
import { parse as parseJsonTyped } from 'butterfly-web/dist/net/jsonParsing'

//! Declares com.lightningkite.butterflytemplate.models.Post
export class Post {
    public userId: number;
    public id: number;
    public title: string;
    public body: string;
    public constructor(userId: number = 0, id: number = 0, title: string = "", body: string = "") {
        this.userId = userId;
        this.id = id;
        this.title = title;
        this.body = body;
    }
    public static fromJson(obj: any): Post { return new Post(
            parseJsonTyped(obj["userId"], [Number]) as number, 
            parseJsonTyped(obj["id"], [Number]) as number, 
            parseJsonTyped(obj["title"], [String]) as string, 
            parseJsonTyped(obj["body"], [String]) as string
    ) }
    public toJSON(): object { return {
            userId: this.userId, 
            id: this.id, 
            title: this.title, 
            body: this.body
    } }
    public hashCode(): number {
        let hash = 17;
        hash = 31 * hash + hashAnything(this.userId);
        hash = 31 * hash + hashAnything(this.id);
        hash = 31 * hash + hashAnything(this.title);
        hash = 31 * hash + hashAnything(this.body);
        return hash;
    }
    public equals(other: any): boolean { return other instanceof Post && safeEq(this.userId, other.userId) && safeEq(this.id, other.id) && safeEq(this.title, other.title) && safeEq(this.body, other.body) }
    public toString(): string { return `Post(userId=${this.userId}, id=${this.id}, title=${this.title}, body=${this.body})` }
    public copy(userId: number = this.userId, id: number = this.id, title: string = this.title, body: string = this.body): Post { return new Post(userId, id, title, body); }
}

