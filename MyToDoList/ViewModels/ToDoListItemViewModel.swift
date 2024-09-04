//
//  ToDoListItemViewModel.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject{
    @Published var showDescription: Bool = false
    init() {}
    
    
    ///toggle todos isDone property than save to the data
    func toggleState(item: ToDoItem) {
        var itemCopy = item
        itemCopy.state()
        guard let uID = Auth.auth().currentUser?.uid else{return}
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
