//
//  Header.swift
//  MyToDoList
//
//  Created by Ali Batıkan Öcal on 1.09.2024.
//

import SwiftUI

struct Header: View {
    let title: String
    let buttonImage: String
    let action: () -> Void
    var body: some View {
        HStack{
            Text(title)
                .font(.title)
                .foregroundStyle(Color.theme.textOrange)
            Spacer()
            Button(action: action, label: {
                Image(systemName: buttonImage)
                    .foregroundStyle(Color.theme.textOrange)
            })
        }
    }
}

#Preview {
    Header(title: "Header", buttonImage: "plus", action: {})
}
