//Package: com.lightningkite.khrysalistemplate.vg
//Converted using Khrysalis2

import Foundation
import Khrysalis
import RxSwift
import RxRelay
import KhrysalisMaps
import KhrysalisBluetooth



public class HttpDemoVG: ViewGenerator {
    
    
    override public var title: String {
        get {
            return "Http Demo"
        }
    }
    
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
        
        
        public init(userId: Int64, id: Int64, title: String, body: String) {
            self.userId = userId
            self.id = id
            self.title = title
            self.body = body
        }
        convenience public init(_ userId: Int64, _ id: Int64, _ title: String, _ body: String) {
            self.init(userId: userId, id: id, title: title, body: body)
        }
        required public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            userId = try values.decode(Int64.self, forKey: .userId)
            id = try values.decode(Int64.self, forKey: .id)
            title = try values.decode(String.self, forKey: .title)
            body = try values.decode(String.self, forKey: .body)
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
        
    }
    
    override public func generate(dependency: ViewDependency) -> View {
        var xml = HttpDemoXml()
        var view = xml.setup(dependency)
        xml.items.bind(data: HttpClient.call("https://jsonplaceholder.typicode.com/posts/").readJson(Array<Post>.self).toObservable().asObservableProperty([Post(0, 0, "Loading...", "-")]), defaultValue: Post(0, 0, "Default", "Failure"), makeView: { (observable) in 
            var cellXml = ComponentTextXml()
            var cellView = cellXml.setup(dependency)
            cellXml.label.bindString(observable.map{ (it) in 
                it.title
            })
            return cellView
        })
        return view
    }
    override public func generate(_ dependency: ViewDependency) -> View {
        return generate(dependency: dependency)
    }
    
    override public init() {
        super.init()
    }
}
 
