//
//  MyToDoListApp.swift
//  MyToDoList
//
//  Created by Ali Batıkan Öcal on 28.08.2024.
//

import SwiftUI
import FirebaseCore

@main
struct MyToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
        
            Main()
        
        }
    }
}
