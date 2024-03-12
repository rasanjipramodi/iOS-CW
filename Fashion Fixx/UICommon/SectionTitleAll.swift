//
//  SectionTitleAll.swift
//  Fashion Fixx
//
//  Created by Tharaka Mohotti on 2024-03-12.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = " Title"
    @State var titleAll: String = "View All"
    var didTap : (()->())?
    
    var body: some View {
        
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryColor)
            
        }
        .frame(height: 40)
    }
}

#Preview {
    SectionTitleAll()
        .padding(20)
}
