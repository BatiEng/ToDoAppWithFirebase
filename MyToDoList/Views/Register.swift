//
//  RegisterView.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI

struct Register: View {
    @StateObject private var vm: RegisterViewModel = RegisterViewModel()
    @FocusState var isFocus: Bool
    var body: some View {
        GeometryReader{ geo in
            NavigationStack{
                ZStack{
                    VStack{
                        logo
                        form
                        BigButton(title: "Register", action: {
                            self.dismissKeyboard()
                            vm.register()
                        })
                        
                        .offset(y: -50)
                        signInButton

                    }
                    
                    .toolbar(.hidden)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .onTapGesture {
                    self.dismissKeyboard()
                }
            }
                
            
        }
        
    }
}

#Preview {
    NavigationStack{
        Register()
    }
    
}


extension Register{
    
    private var logo: some View{
        Image("bati-logo")
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .padding(.bottom, 20)
            .offset(y: -10)
    }
    
    private var form: some View{
        VStack(spacing: 20){
            HStack{
                Text("Welcome")
                    .padding(.vertical)
                    .font(.title)
                    .foregroundStyle(Color.theme.textOrange)
                    .fontDesign(.rounded)
                Spacer()
            }
            HStack{
                Image(systemName: "person.fill")
                TextField("Full Name", text: $vm.name)
                    .autocorrectionDisabled(false)
            }
            Divider()
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
            HStack{
                Image(systemName: "lock.fill")
                SecureField("Password Again", text: $vm.passwordAgain)
            }
            Divider()
            if !vm.errorMessage.isEmpty{
                Text(vm.errorMessage)
                    .foregroundStyle(Color.theme.warningText)
                    .fontDesign(.rounded)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .padding(.horizontal, 20)
        .offset(y: -80)
    }
    
    private var signInButton: some View{
        VStack(spacing: 15){
            Text("Already have account?")
                .fontDesign(.rounded)
            NavigationLink {
                Login()
            } label: {
                Text("Sign in")
                    .foregroundStyle(Color.theme.textOrange)
                    .fontDesign(.rounded)
            }
        }
    }
}
