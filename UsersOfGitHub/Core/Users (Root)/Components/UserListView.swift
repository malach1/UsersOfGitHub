//
//  UserListView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import SwiftUI

struct UserListView: View {
    // MARK: VIEWMODEL
    @ObservedObject var userVM: UserViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(userVM.users) { user in
                    NavigationLink(value: user) {
                        UserRowView(user: user)
                    }
                    .onAppear {
                        if user == userVM.users.last {
                            Task { await userVM.fetchUsers() }
                        }
                    }
                    
                    LineSeparatorView()
                }
            }
        }
    }
}

#Preview {
    UserView(service: NetworkDataService())
}
