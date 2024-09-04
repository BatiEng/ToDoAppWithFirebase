//
//  NewItemViewModel.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject{
    init() {
        
    }
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate = Date()
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    
    ///save new todos to data
    func save(){
        guard validate() else{return}
        guard let uID = Auth.auth().currentUser?.uid else{return}
        let newItemId = UUID().uuidString
        let newItem = ToDoItem(id: newItemId, title: title,
                               description: description,
                               dueDate: dueDate.timeIntervalSince1970,
                               createdDate: Date().timeIntervalSince1970,
                               isDone: false )
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newItemId)
            .setData(newItem.asDictionary())
    }
    
    ///Validate whether inputs valid or not
    func validate() -> Bool{
        errorMessage = ""
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty,
              !description.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill all empty field"
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            errorMessage = "You must select date in the future"
            return false
        }
        return true
    }
}
