//
//  Color+Ex.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ColorTheme()
}

struct ColorTheme{
    let textOrange = Color("TextOrange")
    let warningText = Color("WarningText")
}


extension UIColor{
    static let theme = UIColorTheme()
}

struct UIColorTheme{
    let textOrange = UIColor(Color.theme.textOrange)
    let warningText = UIColor(Color.theme.warningText)
}
