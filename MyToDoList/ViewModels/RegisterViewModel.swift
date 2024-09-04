//
//  RegisterViewModel.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordAgain: String = ""
    @Published var errorMessage: String = ""
    
    
    init(){}
    
    ///Register User to data
    func register(){
        guard validate() else{ return}
        print("created1")
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            print("created2")
            self?.insertUser(id: userID)
            self?.errorMessage = "Account has been created succesfully"
        }
    }
    
    ///Insert user to data with given id
    private func insertUser(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    ///Validate whether inputs valid or not
    ///
    ///Mail: It must contains '@' and '.' otherwise return false
    ///
    ///Password: It must has more then 6 characters otherwiser return false
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !passwordAgain.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all empty field"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        guard password.count >= 6 else{
            errorMessage = "Password must be more than 6 characters"
            return false
        }
        guard password == passwordAgain else{
            errorMessage = "Passwords must be the same"
            return false
        }
        
        return true
    }
}

