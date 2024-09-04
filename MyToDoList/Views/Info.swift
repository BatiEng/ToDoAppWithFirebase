//
//  Info.swift
//  MyToDoList
//
//  Created by Ali Batıkan Öcal on 4.09.2024.
//

import SwiftUI

struct Info: View {
    var body: some View {
        VStack(spacing: 20){
            Header(title: "About Creator", buttonImage: "") {
                
            }
            .padding()
            Spacer()
            VStack{
                Text("This app created by BatiEng")
                    .font(.title)
                Link("My Github", destination: URL(string: "https://github.com/BatiEng")!)
                    .font(.title2)
            }
            .offset(y: -300)
        }
    }
}

#Preview {
    Info()
}
