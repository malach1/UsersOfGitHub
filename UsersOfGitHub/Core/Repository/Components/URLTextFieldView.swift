//
//  URLTextField.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/12.
//

import SwiftUI

struct URLTextFieldView: View {
    @State var urlText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .foregroundColor(
                    urlText.isEmpty ?
                    Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Website url", text: $urlText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
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
    URLTextFieldView()
}
