//
//  UserProfileViewModelTests.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import XCTest
@testable import UsersOfGitHub

class UserProfileViewModelTests: XCTestCase {
    
    func testInit() {
        let testLogin = "malach1"
        let service: NetworkServiceProtocol = MockNetworkDataService()
        let viewModel = UserProfileViewModel(login: testLogin, service: service)

        XCTAssertNotNil(viewModel, "This view model should not be nil.")
    }
    
    func testFetchUserProfile() async {
        // Test Case Parameters
        let testLogin = "malach1"
        let testCorrectName = "Malachi Hul"
        let testInCorrectName = "Dont Exists"
        
        let service = MockNetworkDataService()
        let viewModel = UserProfileViewModel(login: testLogin, service: service)
    
        await viewModel.fetchUserProfile()
        if let name = viewModel.userProfile?.name{
            XCTAssert(name == testCorrectName, "Name doesn't match")
            XCTAssert(name != testInCorrectName, "Name should not match")
        } else {
            XCTFail("Error: No name was present")
        }
    }
    
    func testGetMetaDataFromUserProfile() async {
        // Test Parameters
        let testLogin = "malach1"
        let testFullName = "Malachi Hul"
        
        let service = MockNetworkDataService()
        let viewModel = UserProfileViewModel(login: testLogin, service: service)
        await viewModel.fetchUserProfile()
        
        
        let user = User(id: 1, login: testLogin, avatarUrl: "")
        
        let name = viewModel.getUsernameFromProfile()
        XCTAssert(name == testLogin)
        
        let fullName = viewModel.getFullNameFromProfile()
        XCTAssert(fullName == testFullName)
        
        let followersCount = viewModel.getFollowersCount()
        XCTAssert(followersCount == "4")
        
        let followingCount = viewModel.getFollowingCount()
        XCTAssert(followingCount == "11")
        
        
    }
}
