//
//  RepositoryViewModel.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/12.
//

import Foundation

class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Respositories]?
    
    private let login: String
    private let service: NetworkServiceProtocol
    
    init(login: String, service: NetworkServiceProtocol) {
        self.login = login
        self.service = service
        Task { await fetchRepository() }
    }
    
    @MainActor
    func fetchRepository() async {
        self.repositories = try? await service.fetchRepository(login: self.login)
    }
}
