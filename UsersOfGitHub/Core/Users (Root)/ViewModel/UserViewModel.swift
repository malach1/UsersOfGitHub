//
//  UserViewModel.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchUser: User?
    
    let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func fetchUsers() async {
        guard let usersReceived = try? await service.fetchUsers() else {
            print("Warning: No data received from service.")
            return
        }
        
        let uniqueUsers = usersReceived.filter { user in
            !self.users.contains { $0.id == user.id }
        }
        
        self.users.append(contentsOf: uniqueUsers)
    }
    
    func getUserName(user: User) -> String {
        let username = user.login
        return username
    }
}
