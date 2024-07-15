//
//  UserRowView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import SwiftUI

struct UserRowView: View {
    // STATES AND BINDING
    @State var user: User
    
    var body: some View {
        // Image and Name
        HStack() {
            AvatarImageView(url: user.avatarUrl)
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .padding(.leading, 15)
            
            Text(user.login)
                .padding(.leading, 15)
                .font(.title2)
            
            Spacer()
        }
        .padding(.leading, 10)
        .font(.subheadline)
    }
}

#Preview {
    UserView(service: NetworkDataService())
}
