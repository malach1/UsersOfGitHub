//
//  MockNetworkDataService.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import Foundation

class MockNetworkDataService: NetworkServiceProtocol, HTTPDataDownloader {
    
    var mockCustomData: Data?
    
    func fetchUsers() async -> [User]? {
        do {
            let users = try await mockFetchData(as: [User].self, data: mockCustomData ?? TestMockData.usersMockData)
            return users
        } catch {
            print("No data")
            return nil
        }
    }
    
    func fetchUserProfile(login: String) async -> UserProfile? {
        do {
            let userProfile = try await mockFetchData(as: UserProfile.self, data: mockCustomData ?? TestMockData.userDetailsMockData)
            return userProfile
        } catch {
            print("No data")
            return nil
        }
    }
    
    func fetchRepository(login: String) async -> [Respositories]? {
        do {
            let repos = try await mockFetchData(as: [Respositories].self, data: mockCustomData ?? TestMockData.reposMockData)
            return repos
        } catch {
            print("No data")
            return nil
        }
    }
}


extension HTTPDataDownloader {
    func mockFetchData<T: Decodable>(as type: T.Type, data: Data) async throws -> T?  {
        let jsonData = data
        return try JSONDecoder().decode(type, from: jsonData)
    }
}
