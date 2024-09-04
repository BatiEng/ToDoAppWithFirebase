//
//  MainView.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI

struct Main: View {
    @StateObject private var vm: MainViewModel = MainViewModel()
    var body: some View {
        if vm.isSignedIn, !vm.currentUserID.isEmpty {
                tab
        } else{
                Login()
            
        }
       
    }
}

#Preview {
    Main()
}


extension Main{
    private var tab: some View{
        TabView{
            ToDoList(userID: vm.currentUserID)
                .tabItem { Label("ToDo", systemImage: "list.clipboard").foregroundStyle(Color.theme.textOrange) }
            Profile()
                .tabItem { Label("Profile", systemImage: "person.circle") }
        }
        .tint(Color.theme.textOrange)
    }
}
