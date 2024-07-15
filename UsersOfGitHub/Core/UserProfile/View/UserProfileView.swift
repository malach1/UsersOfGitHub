//
//  UserProfileView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import SwiftUI

struct UserProfileView: View {
    // MARK: ENVIRONMENT
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: VIEWMODEL
    @ObservedObject var userProfileVM: UserProfileViewModel
    @ObservedObject var repositoriesVM: RepositoryViewModel
    
    private let login: String
    init(login: String, service: NetworkServiceProtocol) {
        self.login = login
        self.userProfileVM = UserProfileViewModel(login: login, service: service)
        self.repositoriesVM = RepositoryViewModel(login: login, service: service)
    }
    
    // MARK: STATES AND BINDINGS
    @State var showPicker = false
    @State var show = false
    
    
    // MARK: BODY
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.black.ignoresSafeArea()
            
            VStack() {
                    AvatarAndNamePlateView(userProfileVM: userProfileVM, show: $show)
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity)
                    
                    RepositoryListView(repositoriesVM: repositoriesVM)
                        .foregroundColor(.white)
                        .navigationDestination(for: Respositories.self) { repo in
                            let githubDomain = "https://www.github.com"
                            let login = userProfileVM.getUsernameFromProfile()
                            let repoName = repo.name
                            
                            let urlString = "\(githubDomain)/\(login)/\(repoName)"
                            if let url = URL(string: urlString) {
                                RepositoryWebView(url: url)
                            }
                        }
            }
            .frame(alignment: .top)
            
            Image(systemName: "arrowshape.backward.circle.fill")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 25, height: 25)
                .offset(x: 30, y: 10)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.show = true
                }
            }
        }
    }
}

// MARK: PREVIEW
#Preview {
    UserProfileView(login: "malach1", service: NetworkDataService())
}


