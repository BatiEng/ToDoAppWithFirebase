//
//  ProfileView.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI

struct Profile: View {
    @StateObject private var vm: ProfileViewModel = ProfileViewModel()
    @State private var isShowInfo: Bool = false
    init() {
        
    }
    var body: some View {
            VStack(spacing: 10){
                Header(title: "Profile", buttonImage: "info.circle.fill") {
                    isShowInfo.toggle()
                }
                .padding()
                Spacer()
                VStack{
                    if let user = vm.user{
                        Image(systemName: "person.circle")
                            .font(.system(size: 150))
                        Text(user.name)
                        Text(user.email)
                        Text("Joined At: \(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    } else{
                        
                    }
                    
                    BigButton(title: "Log Out") {
                        vm.logOut()
                    }
                }
                .offset(y: -200)
                
            }
            .sheet(isPresented: $isShowInfo, content: {
                Info()
            })
            .onAppear{
                vm.fetchUser()
            }
        
        
    }
}

#Preview {
        Profile()
    
}
