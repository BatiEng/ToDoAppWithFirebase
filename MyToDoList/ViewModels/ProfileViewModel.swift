//
//  ProfileViewModel.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    init() {
        
    }
    
    /// fetch user data from database
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else{return}
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID).getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else{return}
                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    
    ///log out from account
    func logOut(){
        do {
            try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
    }
}
