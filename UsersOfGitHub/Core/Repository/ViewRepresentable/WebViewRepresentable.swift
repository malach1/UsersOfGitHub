//
//  WebViewRepresentable.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/12.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let request: URLRequest
    private var webView = WKWebView()
    
    init(request: URLRequest) {
        self.request = request
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

