// Generated by Khrysalis Swift converter - this file will be overwritten.
// File: models/Post.kt
// Package: com.lightningkite.butterflytemplate.models
import Butterfly
import Foundation

public class Post : Codable, KDataClass {
    public var userId: Int64
    public var id: Int64
    public var title: String
    public var body: String
    public init(userId: Int64 = 0, id: Int64 = 0, title: String = "", body: String = "") {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        //Necessary properties should be initialized now
    }
    convenience required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            userId: try values.decodeIfPresent(Int64.self, forKey: .userId) ?? 0,
            id: try values.decodeIfPresent(Int64.self, forKey: .id) ?? 0,
            title: try values.decodeIfPresent(String.self, forKey: .title) ?? "",
            body: try values.decodeIfPresent(String.self, forKey: .body) ?? ""
        )
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.body, forKey: .body)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(userId)
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(body)
    }
    public static func == (lhs: Post, rhs: Post) -> Bool { return lhs.userId == rhs.userId && lhs.id == rhs.id && lhs.title == rhs.title && lhs.body == rhs.body }
    public var description: String { return "Post(userId = \(self.userId), id = \(self.id), title = \(self.title), body = \(self.body))" }
    public func copy(userId: Int64? = nil, id: Int64? = nil, title: String? = nil, body: String? = nil) -> Post { return Post(userId: userId ?? self.userId, id: id ?? self.id, title: title ?? self.title, body: body ?? self.body) }
}


