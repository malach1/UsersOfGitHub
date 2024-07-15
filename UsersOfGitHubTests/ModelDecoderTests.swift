//
//  UsersOfGitHubTests.swift
//  UsersOfGitHubTests
//
//  Created by Malachi Hul on 2024/07/10.
//

import XCTest
@testable import UsersOfGitHub

final class ModelDecoderTests: XCTestCase {

    func testDecodeGitHubUsersIntoArray() throws {
        do {
            let users = try JSONDecoder().decode([User].self, from: TestMockData.usersMockData)
            XCTAssert(users.count == 19)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodeUserDetails() throws {
        do {
            let userProfile = try JSONDecoder().decode(UserProfile.self, from: TestMockData.userDetailsMockData)
            XCTAssertEqual(userProfile.login, "malach1")
            XCTAssertEqual(userProfile.name, "Malachi Hul")
        } catch {
            XCTFail(error.localizedDescription)
        }

    }
    
    func testDecodeReposIntoArray() throws {
        do {
            let repos = try JSONDecoder().decode([Respositories].self, from: TestMockData.reposMockData)
            XCTAssert(repos.count == 7)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

}
