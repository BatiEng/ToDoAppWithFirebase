//
//  ToDoItem.swift
//  MyToDoList
//
//  Created by Ali Batıkan Öcal on 29.08.2024.
//

import Foundation

struct ToDoItem: Codable, Identifiable{
    let id: String
    let title: String
    let description: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func state(){
        isDone.toggle()
    }
}

