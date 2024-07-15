//
//  Color.swift
//  UsersOfGitHub
//
//  Created by Malachi Hul on 2024/07/10.
//

import Foundation
import SwiftUI


extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
}
