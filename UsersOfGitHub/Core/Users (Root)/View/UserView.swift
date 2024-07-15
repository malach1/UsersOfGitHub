//
//  UserView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import SwiftUI

struct UserView: View {
    // MARK: VIEWMODEL
    @StateObject var userVM: UserViewModel
    
    private let service: NetworkServiceProtocol
    init(service: NetworkServiceProtocol) {
        self.service = service
        self._userVM = StateObject(wrappedValue: UserViewModel(service: service))
    }
    
    // MARK: STATES AND BINDINGS
    @State private var navigationPath = NavigationPath()
    @State var searchableUsernameText = ""
    /// network progress
    @State private var showMessage = false
    @State private var isLoading = true
    
    // MARK: BODY
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                if userVM.users.count > 0 {
                    VStack {
                        SearchBarView(searchableUsernameText: $searchableUsernameText)
                        
                        LineSeparatorView()
                        
                        UserListView(userVM: userVM)
                    }
                    .navigationDestination(for: User.self) { user in
                        UserProfileView(login: user.login, service: service)
                    }
                    .navigationDestination(for: String.self) { username in
                        UserProfileView(login: username, service: service)
                    }
                } else {
                    if isLoading {
                        NetworkProgressView(isLoading: $isLoading, showMessage: $showMessage)
                    } else {
                        Text("Could not reach server, try again later")
                            .foregroundColor(.red)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("GitHub Users")
            .navigationBarBackButtonHidden(true)
            .foregroundStyle(.white)
            .navigationBarColor(backgroundColor: .darkGray, titleColor: .white, backButtonColor: .white)
        }
        .task {
            await userVM.fetchUsers()
        }
    }
}

// MARK: PREVIEW
#Preview {
    UserView(service: NetworkDataService())
}
