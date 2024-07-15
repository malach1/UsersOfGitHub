//
//  UserProfile.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/11.
//

import Foundation

struct UserProfile: Decodable, Identifiable, Equatable, Hashable {
    var id: Int
    let login: String
    let avatarUrl: String
    let name: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case id, login, name, followers, following
        case avatarUrl = "avatar_url"
    }
}
