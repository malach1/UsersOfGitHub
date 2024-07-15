//
//  ProfileImageView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import SwiftUI

struct ProfileImageView: View {
    // MARK: STATES AND BINDINGS
    @State var userProfileVM: UserProfileViewModel
    @Binding var show : Bool
    /// network progress
    @State private var showMessage = false
    @State private var isLoading = true
    
    var body: some View {
        if let userprofile = userProfileVM.userProfile {
            GeometryReader(content: { geo in
                AsyncImage(url: URL(string: userProfileVM.getAvatar())) { phase in
                    if let image = phase.image {
                        image
                            .resizable().scaledToFill()
                            .frame(width:show ? geo.size.width : 110, height: show ? 320 : 110)
                            .clipShape(.rect(cornerRadius: show ? 0 : 100))
                            .padding(.top , show ? 0 : 100)
                    } else {
                        ProgressView()
                    }
                }
            })
            .frame(maxWidth: show ? .infinity : 110,maxHeight: show ? 240 : 210)
        } else {
            VStack(alignment: .center) {
                if isLoading {
                    NetworkProgressView(isLoading: $isLoading, showMessage: $showMessage)
                        .padding(.top, 500)
                } else {
                    Text("Could not find username: \(userProfileVM.login)")
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding(.top, 500)
                }
            }
        }
    }
}

#Preview {
    UserProfileView(login: "malach", service: NetworkDataService())
}
