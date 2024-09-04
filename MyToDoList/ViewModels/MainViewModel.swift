//
//  MainViewModel.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import FirebaseAuth


class MainViewModel: ObservableObject{
    @Published var currentUserID: String = ""
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self]  _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    /// check user sign in or not then return true or false
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
