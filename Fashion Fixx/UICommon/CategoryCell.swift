//
//  CategoryCell.swift
//  Fashion Fixx
//
//  Created by Tharaka Mohotti on 2024-03-12.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    @State var tObj: TypeModel = TypeModel(dict: [ : ])
    @State var color: Color = Color.yellow
    var didAddCart: ( ()->() )?
    
    var body: some View {
        HStack{
            
            WebImage(url: URL(string: tObj.image ))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            
            
            Text(tObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background( tObj.color.opacity(0.3) )
        .cornerRadius(16)
    }
}


#Preview {
    CategoryCell(tObj: TypeModel(dict: ["": ""]))
}
