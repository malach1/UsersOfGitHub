//
//  LineSeparatorView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/13.
//

import SwiftUI

struct LineSeparatorView: View {
    
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(height: 1)
    }
}

#Preview {
    LineSeparatorView()
}
