//
//  NamePlateView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import SwiftUI

struct NamePlateView: View {
    // MARK: VIEWMODEL
    @State var userProfileVM: UserProfileViewModel
    
    // MARK: STATES AND BINDING
    @Binding var show: Bool
    
    var body: some View {
        if let userProfile = userProfileVM.userProfile {
            HStack {
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(userProfileVM.getUsernameFromProfile()).bold()
                        .font(.largeTitle)
                    
                    Text(userProfileVM.getFullNameFromProfile())
                    if show {
                        Text("Followers: \(userProfileVM.getFollowersCount())")
                        Text("Following: \(userProfileVM.getFollowingCount())")
                    }
                }
                .foregroundStyle(.white)
            }
            .padding(.trailing, 10)
            .background(.gray.opacity(show ? 0.70: 0))
            .offset(y: -5)
        }
    }
}


#Preview {
    UserProfileView(login: "malach1", service: NetworkDataService())
}
