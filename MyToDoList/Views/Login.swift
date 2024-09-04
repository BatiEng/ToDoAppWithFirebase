//
//  LoginView.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI

struct Login: View {
    @StateObject private var vm: LoginViewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                    logo
                    form
                    BigButton(title: "Sign In") {
                        vm.login()
                    }
                    Spacer()
                    newAccountButton
                }
        }
        .toolbar(.hidden)
                
                
            
                
        
    }
}

#Preview {
    NavigationStack{
        Login()
    }
    
}





extension Login{
    
    private var logo: some View{
        Image("bati-logo")
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .padding(.bottom, 20)
    }
    
    private var form: some View{
        VStack(spacing: 20){
            HStack{
                Text("Welcome Again")
                    .padding(.vertical)
                    .font(.title)
                    .foregroundStyle(Color.theme.textOrange)
                    .fontDesign(.rounded)
                Spacer()
            }
            HStack{
                Image(systemName: "envelope.fill")
                TextField("Email", text: $vm.email)
                    .autocorrectionDisabled(false)
                    .textInputAutocapitalization(.never)
            }
            Divider()
            HStack{
                Image(systemName: "lock.fill")
                SecureField("Password", text: $vm.password)
            }
            Divider()
            if !vm.errorMessage.isEmpty{
                Text(vm.errorMessage)
                    .foregroundStyle(Color.theme.warningText)
                    .fontDesign(.rounded)
            }
        }
        .offset(y: -60)
        .padding()
        .padding(.horizontal, 20)
    }
    
    
    private var newAccountButton: some View{
        VStack(spacing: 15){
            Text("Don't you have account?")
                .fontDesign(.rounded)
            NavigationLink {
                Register()
            } label: {
                Text("Create New Account")
                    .foregroundStyle(Color.theme.textOrange)
                    .fontDesign(.rounded)
            }
        }
    }
}
