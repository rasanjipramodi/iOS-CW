//
//  RoundButton.swift
//  Fashion Fixx
//
//  Created by Tharaka Mohotti on 2024-03-12.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
        .background( Color.primaryColor)
        .cornerRadius(8)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
