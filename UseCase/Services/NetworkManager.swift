//
//  NetworkManager.swift
//  UseCase
//
//  Created by Sergey Bohachenko on 08.07.2022.
//

import Foundation
import Alamofire

struct Article {
    var author: String?
    var content: String?
    var description: String?
    var publishedAt: Date?
    var source: Source
    var title: String?
    var url: String?
    var urlToImage: String?
    
    init?(json: [String:Any]) {
        guard
            let author = json["author"] as? String,
            let content = json["content"] as? String,
            let description = json["description"] as? String,
            let publishedAt = json["publishedAt"] as? Date,
            let source = json["source"] as? Source,
            let title = json["title"] as? String,
            let url = json["url"] as? String,
            let urlToImage = json["urlToImage"] as? String
        else {
            return nil
        }
        self.author = author
        self.content = content
        self.description = description
        self.publishedAt = publishedAt
        self.source = source
        self.title = title
        self.url = url
        self.urlToImage = urlToImage
    }
    
    static func getArray(from jsonArray: Any) -> [Article]? {

        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        var articles: [Article] = []

        for jsonObject in jsonArray {
            if let article = Article(json: jsonObject) {
                articles.append(article)
            }
        }
        return articles
    }
    
}

struct Source {
    var id: Int?
    var name: String?
}

struct Post {
    var id: Int
    var title: String
    var body: String
    var userId: Int
    init?(json: [String: Any]) {

        guard
            let id = json["id"] as? Int,
            let title = json["title"] as? String,
            let body = json["body"] as? String,
            let userId = json["userId"] as? Int
        else {
            return nil
        }
        self.id = id
        self.title = title
        self.body = body
        self.userId = userId
    }
    
    static func getArray(from jsonArray: Any) -> [Post]? {

        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        var posts: [Post] = []

        for jsonObject in jsonArray {
            if let post = Post(json: jsonObject) {
                posts.append(post)
            }
        }
        return posts
    }
//    static func getArray(from jsonArray: Any) -> [Post]? {
//           guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
//           return jsonArray.flatMap { Post(json: $0) }
//       }
}
class NetworkManager {
    
    typealias WebserviceResponse = ([[String:Any]]?, Error?) -> Void
    
    func execute(_ url:URL, completion:@escaping WebserviceResponse) {
        let request = AF.request(url)
            request.validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }
    
    func GetArticles() {
        let request = AF.request("http://jsonplaceholder.typicode.com/posts")
        request.responseJSON { responseJSON in

            switch responseJSON.result {
            case .success(let value):
                 guard let posts = Article.getArray(from: value) else { return }
                 print(posts)

            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
