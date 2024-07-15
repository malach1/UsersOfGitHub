//
//  RepositoryListView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import SwiftUI

struct RepositoryListView: View {
    // MARK: VIEWMODEL
    @ObservedObject var repositoriesVM: RepositoryViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(repositoriesVM.repositories ?? []) { repo in
                    NavigationLink(value: repo) {
                        RepositoryRowView(repository: repo)
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
