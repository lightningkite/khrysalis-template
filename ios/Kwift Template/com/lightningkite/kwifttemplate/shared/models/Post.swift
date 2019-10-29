//Package: com.lightningkite.kwifttemplate.shared.models
//Converted using Kwift2

import Foundation
import Kwift
import KwiftMaps



public class Post: Codable, Equatable, Hashable {
    
    public var userId: Int64
    public var id: Int64
    public var title: String
    public var body: String
    
    public static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.userId == rhs.userId &&
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.body == rhs.body
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(userId)
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(body)
    }
    public func copy(
        userId: (Int64)? = nil,
        id: (Int64)? = nil,
        title: (String)? = nil,
        body: (String)? = nil
    ) -> Post {
        return Post(
            userId: userId ?? self.userId,
            id: id ?? self.id,
            title: title ?? self.title,
            body: body ?? self.body
        )
    }
    
    
    public init(userId: Int64 = 0, id: Int64 = 0, title: String = "", body: String = "") {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    convenience public init(_ userId: Int64, _ id: Int64 = 0, _ title: String = "", _ body: String = "") {
        self.init(userId: userId, id: id, title: title, body: body)
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int64.self, forKey: .userId) ?? 0
        id = try values.decodeIfPresent(Int64.self, forKey: .id) ?? 0
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        body = try values.decodeIfPresent(String.self, forKey: .body) ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
 
