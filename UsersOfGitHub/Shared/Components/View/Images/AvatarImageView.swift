//
//  AvatarImageView.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/11.
//

import SwiftUI

struct AvatarImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
        }
    }
}

#Preview {
    AvatarImageView(url: "https://avatars.githubusercontent.com/u/5972850?v=4")
}
