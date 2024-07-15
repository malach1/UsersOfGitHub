//
//  View.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/14.
//

import SwiftUI

extension View {
    func navigationBarColor(backgroundColor: UIColor, titleColor: UIColor, backButtonColor: UIColor) -> some View {
        self.modifier(NavigationBarColorViewModifier(backgroundColor: backgroundColor, titleColor: titleColor, backButtonColor: backButtonColor))
    }
}
