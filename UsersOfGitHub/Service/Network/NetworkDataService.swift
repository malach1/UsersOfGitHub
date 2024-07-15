//
//  UsersDataService.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import SwiftUI

protocol NetworkServiceProtocol {
    func fetchUsers() async throws -> [User]?
    func fetchUserProfile(login: String) async throws -> UserProfile?
    func fetchRepository(login: String) async throws -> [Respositories]?
}

class NetworkDataService: NetworkServiceProtocol, HTTPDataDownloader {
    private var page = 1
    private let pageLimit = 50
    
    // MARK: URL COMPONENTS
    private var baseUrlComponents: URLComponents {
        var components  = URLComponents()
        components.scheme = "https"
        components.host = APIConstant.hostUrl.rawValue
        components.path = "/users"
        return components
    }
    
    private var baseUrlComponentsString: String? {
        return baseUrlComponents.url?.absoluteString
    }
    
    private var allUserUrlString: String? {
        var components = baseUrlComponents
        components.queryItems = [
            URLQueryItem(name: "since", value: "\(self.page)"),
            URLQueryItem(name: "per_page", value: "\(self.pageLimit)")
        ]
        return components.url?.absoluteString
    }
    
    // MARK: API INTERFACE
    func fetchUsers() async throws -> [User]? {
        guard let urlString = allUserUrlString else { return nil }
        guard let url = buildURLWithPath(path: urlString) else { return nil }
        
        guard let request = try buildRequest(url: url) else {
            throw APIError.requestFailure
        }
        
        do {
            let users = try await fetchData(as: [User].self, endpointRequest: request)
            processPagination()
            return users
        } catch {
            throw APIError.requestFailure
        }
        
    }
    
    func fetchUserProfile(login: String) async throws -> UserProfile? {
        guard let baseURL = baseUrlComponentsString else { return nil }
        guard let url = buildURLWithPath(path: "\("\(baseURL)/\(login)")") else { return nil }
        
        guard let request = try buildRequest(url: url) else {
            throw APIError.requestFailure
        }
        
        do {
            let userProfile = try await fetchData(as: UserProfile.self, endpointRequest: request)  // PROD
            return userProfile
        } catch {
            throw APIError.requestFailure
        }
    }
    
    func fetchRepository(login: String) async throws -> [Respositories]? {
        guard let baseURL = baseUrlComponentsString else { return nil }
        guard let url = buildURLWithPath(path: "\(baseURL)/\(login)/repos") else { return nil }
        
        guard let request = try buildRequest(url: url) else {
            throw APIError.requestFailure
        }
        
        do {
            let repos = try await fetchData(as: [Respositories].self, endpointRequest: request)  // PROD
            return repos
        } catch {
            throw APIError.requestFailure
        }
    }
    
    // MARK: URL REQUEST
    private func buildURLWithPath(path: String) -> URL? {
        guard let url = URL(string: path) else {
            print("LOG - Unable to build URL")
            return nil
        }
        return url
    }
    
    private func buildRequest(url: URL) throws -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( APIConstant.acceptHeaderValue.rawValue, forHTTPHeaderField: APIConstant.acceptHeaderField.rawValue)
        request.setValue("Bearer \(APIConstant.accessToken.rawValue)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    // MARK: Helpers
    private func processPagination() {
        self.page += self.pageLimit
    }
}
