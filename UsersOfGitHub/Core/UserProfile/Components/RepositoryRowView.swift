//
//  RepositoryRow.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/12.
//

import SwiftUI

struct RepositoryRowView: View {
    // MARK: STATES AND BINDINGS
    @State var repository: Respositories
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(repository.name).bold()
                    .font(.title2)
                
                Text(repository.description ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(repository.language ?? "")
                Text("\u{2B50} \(String(describing: repository.getStarCount()))")
            }
        }
        .padding()
    }
}

#Preview {
    RepositoryRowView(repository: Respositories(id: 5972850, 
                                                name: "ChatWithMyself",
                                                fork: false,
                                                url: "https://api.github.com/repos/malach1/ChatWithMysel",
                                                language: "Swift",
                                                description: "Test Description",
                                                starGazeCount: 5)
    )
}
