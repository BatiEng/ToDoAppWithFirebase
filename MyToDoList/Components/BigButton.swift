//
//  BigButton.swift
//  ToDoWithFirebase
//
//  Created by Ali Batıkan Öcal on 26.08.2024.
//

import SwiftUI

struct BigButton: View {
    var title: String
    let action: () -> Void
    var body: some View {
        VStack{
            Button(action: action, label: {
                Text(title)
                    .frame(width: 150)
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.theme.textOrange)
                    }
            })
        }
    }
}

#Preview {
    BigButton(title: "Button", action: {})
}
