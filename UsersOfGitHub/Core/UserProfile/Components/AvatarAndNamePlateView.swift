//
//  AvatarAndNamePlateView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import SwiftUI

struct AvatarAndNamePlateView: View {
    // MARK: VIEWMODEL
    @ObservedObject var userProfileVM: UserProfileViewModel
    
    // MARK: STATES AND BINDING
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            ZStack(alignment:show ? .leading : .center) {
                ProfileImageView(userProfileVM: userProfileVM, show: $show)
                    .overlay {
                        NamePlateView(userProfileVM: userProfileVM, show: $show)
                    }
            }
        }
    }
}

#Preview {
    UserProfileView(login: "malach", service: NetworkDataService())
}
