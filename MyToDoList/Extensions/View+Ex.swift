//
//  View+Ex.swift
//  MyToDoList
//
//  Created by Ali Batıkan Öcal on 30.08.2024.
//

import Foundation
import SwiftUI


extension View{
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
