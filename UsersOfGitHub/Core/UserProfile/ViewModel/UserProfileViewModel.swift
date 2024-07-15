//
//  UserProfileViewModel.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/11.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile?
    
    let login: String
    private let service: NetworkServiceProtocol
    
    init(login: String, service: NetworkServiceProtocol) {
        self.login = login
        self.service = service
        Task { await fetchUserProfile() }
    }
    
    @MainActor
    func fetchUserProfile() async {
        self.userProfile = try? await service.fetchUserProfile(login: self.login)
    }
    
    func getUsernameFromProfile() -> String {
        guard let userProfile = self.userProfile else { return "" }
        return userProfile.login
    }
    
    func getAvatar() -> String {
        guard let userProfile = self.userProfile else { return "" }
        return userProfile.avatarUrl
    }
    
    func getFullNameFromProfile() -> String {
        guard let userProfile = self.userProfile else { return "" }
        return userProfile.name
    }
    
    func getFollowersCount() -> String {
        guard let userProfile = self.userProfile else { return "0" }
        return "\(userProfile.followers)"
    }
    
    func getFollowingCount() -> String {
        guard let userProfile = self.userProfile else { return "0" }
        return "\(userProfile.following)"
    }
}
