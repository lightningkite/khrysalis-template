// Generated by Khrysalis TypeScript converter - this file will be overwritten.
// File: models/Post.shared.kt
// Package: com.lightningkite.khrysalistemplate.models
import { hashString } from 'khrysalis/dist/Kotlin'
import { parse as parseJsonTyped } from 'khrysalis/dist/net/jsonParsing'
import { Codable } from 'khrysalis/dist/Codable.actual'

//! Declares com.lightningkite.khrysalistemplate.models.Post
export class Post implements Codable {
    public static implementsInterfaceComLightningkiteKhrysalisCodable = true;
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
    public toJson(): object { return {
            userId: this.userId, 
            id: this.id, 
            title: this.title, 
            body: this.body
    } }
    public hashCode(): number {
        let hash = 17;
        hash = 31 * hash + this.userId;
        hash = 31 * hash + this.id;
        hash = 31 * hash + hashString(this.title);
        hash = 31 * hash + hashString(this.body);
        return hash;
    }
    public equals(other: any): boolean { return other instanceof Post && this.userId === other.userId && this.id === other.id && this.title === other.title && this.body === other.body }
    public toString(): string { return `Post(userId = ${this.userId}, id = ${this.id}, title = ${this.title}, body = ${this.body})` }
    public copy(userId: number = this.userId, id: number = this.id, title: string = this.title, body: string = this.body) { return new Post(userId, id, title, body); }
}

