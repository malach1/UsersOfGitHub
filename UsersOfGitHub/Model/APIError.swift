//
//  APIError.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import Foundation

enum APIError: Error {
    case requestFailure
    case invalidData
    case jsonParseFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .requestFailure: return "Failure with request"
        case .invalidData: return "Invalid data"
        case .jsonParseFailure: return "Failed to parse JSON"
        case let .requestFailed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
        case let .unknownError(error): return "An unknown error occurred \(error.localizedDescription)"
        }
    }
}
