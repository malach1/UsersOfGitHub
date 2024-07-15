//
//  User.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import Foundation

struct User: Decodable, Identifiable, Equatable, Hashable {
    var id: Int
    var login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, login
        case avatarUrl = "avatar_url"
    }
}
