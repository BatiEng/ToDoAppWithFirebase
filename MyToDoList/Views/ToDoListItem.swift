//
//  ToDoListItem.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI

struct ToDoListItem: View {
    var item: ToDoItem
    @StateObject var vm: ToDoListItemViewModel = ToDoListItemViewModel()
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Button(action: {
                        vm.toggleState(item: item)
                    }, label: {
                        Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                            .foregroundStyle(Color.theme.warningText)
                            .font(.title2)
                    })
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 0){
                    Text(item.title)
                        .bold()
                        .font(.title)
                    Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .onTapGesture {
                    vm.showDescription.toggle()
                }
                    
            }
            .padding()
            if vm.showDescription{
                VStack{
                    Text(item.description)
                        .fontDesign(.rounded)
                    Text("Created at: \(Date(timeIntervalSince1970: item.createdDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
            }
        }
        
    }
}

#Preview {
    ToDoListItem(item: ToDoItem(id: "1", title: "MotoGp", description: "firstly watch practice then watch eliminations then watc sprint race after that watch race then say marc marquezzz", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}


// Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.subheadline)

