//
//  ModeratorResponse.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

class ModeratorResponse: Codable {
    var items:[Moderator]
    var hasMore:Bool
    
    enum CodingKeys: String,CodingKey {
        case items
        case hasMore = "has_more"
    }
}


class Moderator: Codable {
    var userId:Int
    var displayName:String
    
    enum CodingKeys: String,CodingKey {
        case userId = "user_id"
        case displayName = "display_name"
    }
}

