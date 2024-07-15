//
//  Repositories.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/12.
//

import Foundation

struct Respositories: Decodable, Identifiable, Equatable, Hashable {
    var id: Int
    let name: String
    let fork: Bool
    let url: String
    let language: String?
    let description: String?
    let starGazeCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, fork, url, language, description
        case starGazeCount = "stargazers_count"
    }
    
    func getStarCount() -> String {
        guard let count = self.starGazeCount else { return "0" }
        return "\(count)"
    }
    
}

