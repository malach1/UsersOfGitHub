//
//  WebViewTest.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/12.
//

import SwiftUI
import WebKit

struct RepositoryWebView: View {
    let webView: WebView?
    
    init(url: URL) {
        self.urlText = url.relativeString
        let request = URLRequest(url: url)
        self.webView = WebView(request: request)
    }
    
    // MARK: STATES AND BINDINGS
    @State var urlText = ""
    
    // MARK: BODY
    var body: some View {
        VStack {
            webView
            
            VStack {
                URLTextFieldView(urlText: urlText)
                    .frame(height: 20)
                    .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Repository")
        .navigationBarColor(backgroundColor: .darkGray, titleColor: .white, backButtonColor: .white)
    }
}

// MARK: PREVIEW
#Preview {
    RepositoryWebView(url: URL(string: "https://www.apple.com")!)
}
