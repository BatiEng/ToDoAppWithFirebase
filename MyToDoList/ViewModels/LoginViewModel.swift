//
//  LoginViewModel.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    /// Login account with given email and password
    func login() {
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if error != nil {
                self.errorMessage = "Invalid email or passord"
            }
        }
    }
    
    ///Validate whether inputs valid or not
    ///
    ///Mail: It must contains '@' and '.' otherwise return false
    ///
    ///Password: It must has more then 6 characters otherwiser return false
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all empty field"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
    }
}
