//
//  NavigationBarColorViewModifier.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/14.
//

import SwiftUI

struct NavigationBarColorViewModifier: ViewModifier {
    var backgroundColor: UIColor
    var titleColor: UIColor
    var backButtonColor: UIColor
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = backgroundColor
                appearance.titleTextAttributes = [.foregroundColor: titleColor]
                appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
                
                let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
                buttonAppearance.normal.titleTextAttributes = [.foregroundColor: backButtonColor]
                
                appearance.buttonAppearance = buttonAppearance
                appearance.backButtonAppearance = buttonAppearance
                
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}
