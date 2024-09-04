//
//  NewItemView.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI

struct NewItem: View {
    @Binding var isShowNewItemView: Bool
    @StateObject private var vm: NewItemViewModel = NewItemViewModel()
    var body: some View {
        VStack{
            Text("New Duty")
                .bold()
                .fontDesign(.rounded)
                .foregroundStyle(Color.theme.textOrange)
                .font(.title)
            Form{
                TextField("Title", text: $vm.title)
                TextField("Description", text: $vm.description)
                DatePicker("Due Date", selection: $vm.dueDate)
                    .datePickerStyle(.graphical)
                    .tint(Color.theme.textOrange )
            }
            .scrollContentBackground(.hidden)
            BigButton(title: "Save") {
                if vm.validate(){
                    vm.save()
                    isShowNewItemView.toggle()
                } else{
                    vm.showAlert.toggle()
                }
                
            }
            .padding(.bottom, 50)
            .alert(vm.errorMessage, isPresented: $vm.showAlert, actions: {
                Button(action: {}, label: {
                    Text("OK")
                        .foregroundStyle(Color.theme.textOrange)
                })
            })
            
        }
        .padding(.top, 40)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    NewItem(isShowNewItemView: .constant(true))
}
