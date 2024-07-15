//
//  NetworkProgressView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/15.
//

import SwiftUI

struct NetworkProgressView: View {
    @Binding var isLoading: Bool
    @Binding var showMessage: Bool
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                    isLoading = false
                    showMessage = true
                }
            }
    }
}

#Preview {
    ZStack {
        Color.black
        NetworkProgressView(isLoading: .constant(true), showMessage: .constant(false))
    }
}
