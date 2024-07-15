//
//  RepoViewModelTests.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import XCTest
@testable import UsersOfGitHub

class RepoViewModelTests: XCTestCase {
    func testInit() {
        let testLogin = "malach1"
        let service: NetworkServiceProtocol = MockNetworkDataService()
        let viewModel = RepositoryViewModel(login: testLogin, service: service)

        XCTAssertNotNil(viewModel, "This view model should not be nil.")
    }
    
    func testFetchRepository() async {
        // Test Case Parameters
        let testLogin = "malach1"
        
        let service = MockNetworkDataService()
        let viewModel = RepositoryViewModel(login: testLogin, service: service)
    
        await viewModel.fetchRepository()
        if let repo = viewModel.repositories {
            XCTAssert(repo.count > 0)
            XCTAssert(repo.count == 7)
            XCTAssertTrue(repo[0].fork == false)
        }
    }
    
    func testConfirmNoForksinRepositry() async {
        // Test Case Parameters
        let testLogin = "malach1"
        
        let service = MockNetworkDataService()
        let viewModel = RepositoryViewModel(login: testLogin, service: service)
    
        await viewModel.fetchRepository()
        if let repo = viewModel.repositories {
            let forkedRepos = repo.filter { $0.fork }
            XCTAssert(forkedRepos.count == 0)
            XCTAssert(repo.count == 7)
        }
    }
}
