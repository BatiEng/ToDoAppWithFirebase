//
//  ToDoListView.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI
import FirebaseFirestore

struct ToDoList: View {
    @StateObject private var vm: ToDoListViewModel = ToDoListViewModel()
    @FirestoreQuery var items: [ToDoItem]
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
    }
    var body: some View {
            VStack {
                Header(title: "TODOS", buttonImage: "plus") {
                    vm.isShowNewItemView.toggle()
                }
                .padding()
                list
                texts
            }
            .sheet(isPresented: $vm.isShowNewItemView, content: {
                NewItem(isShowNewItemView: $vm.isShowNewItemView)
            })
        
    }
}

#Preview {
        ToDoList(userID: "qRdU9HeC2Eg5Lcv8kKCcoTt18Rt2")
    
    
}

extension ToDoList{
    private var list: some View{
        List {
            ForEach(items) { item in
                ToDoListItem(item: item)
                    .swipeActions{
                        Button("Delete") {
                            vm.delete(id: item.id)
                        }
                        .background(Color.red)
                    }
            }
            .listRowSeparator(.hidden)
        }
        
        .listStyle(.plain)
    }
    
    private var texts: some View{
        VStack{
            Text("When you tapp on the row yo can see decription")
                .foregroundStyle(.secondary)
                .font(.caption)
            Text("BATI")
                .foregroundStyle(.secondary)
                .fontDesign(.monospaced)
                .font(.caption)
        }
    }
}


