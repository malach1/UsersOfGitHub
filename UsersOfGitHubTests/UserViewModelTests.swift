//
//  UserViewModelTests.swift
//  UsersOfGitHubTests
//
//  Created by Malachi Hul on 2024/07/12.
//

import XCTest
@testable import UsersOfGitHub

class UserViewModelTests: XCTestCase {
    
    func testInit() {
        let service: NetworkServiceProtocol = MockNetworkDataService()
        let viewModel = UserViewModel(service: service)
        
        XCTAssertNotNil(viewModel, "This view model should not be nil.")
    }
    

    func testSuccessfulUsersFetch() async {
        let service = MockNetworkDataService()
        let viewModel = UserViewModel(service: service)
     
        
        await viewModel.fetchUsers()
        
        XCTAssertTrue(viewModel.users.count > 0)
        XCTAssertTrue(viewModel.users.count == 19)
    }
    
    func testUserFetchInvalidJson() async {
        let service = MockNetworkDataService()
        service.mockCustomData = TestMockData.invalidUsersMockData
        let viewModel = UserViewModel(service: service)
     
        
        await viewModel.fetchUsers()
        
        XCTAssertTrue(viewModel.users.isEmpty)
    }
    
    func testGetUserName() async {
        let testLogin = "malach1"
        let service = MockNetworkDataService()
        let viewModel = UserViewModel(service: service)
     
        let user = User(id: 1, login: testLogin, avatarUrl: "")
        let fullName = viewModel.getUserName(user: user)

        XCTAssertTrue(fullName == testLogin)
    }
}
