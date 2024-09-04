//
//  ToDoListViewModel.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListViewModel: ObservableObject{
    @Published var isShowNewItemView: Bool = false
    
    
    init() {
        
    }
    
    
    ///delete selecting todos
    func delete(id: String) {
        let userID = Auth.auth().currentUser?.uid ?? "" 
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
