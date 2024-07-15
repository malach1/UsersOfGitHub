//
//  SearchBarView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/14.
//

import SwiftUI

struct SearchBarView: View {
    // STATES AND BINDING
    @Binding var searchableUsernameText: String
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchableUsernameText.isEmpty ?
                    Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Enter username", text: $searchableUsernameText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            searchableUsernameText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color.theme.secondaryText)
                                .opacity(searchableUsernameText.isEmpty ? 0 : 1)
                        }
                        .padding(.trailing, 8)
                        
                        VStack {
                            NavigationLink(value: searchableUsernameText) {
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundColor(Color.theme.secondaryText)
                                    .opacity(searchableUsernameText.isEmpty ? 0 : 1)
                                    .onDisappear {
                                        searchableUsernameText = ""
                                    }
                            }
                        }
                    }
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchableUsernameText: .constant(""))
}
