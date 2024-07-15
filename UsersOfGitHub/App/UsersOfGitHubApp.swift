//
//  UsersOfGitHubApp.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import SwiftUI

@main
struct UsersOfGitHubApp: App {
    var body: some Scene {
        WindowGroup {
            UserView(service: NetworkDataService())
        }
    }
}
