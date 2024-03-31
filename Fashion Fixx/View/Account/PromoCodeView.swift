//
//  PromoCodeView.swift
//  Fashion Fixx
//
//  Created by Rasanji Pramodi on 2024-03-24.
//

import SwiftUI

struct PromoCodeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var promoVM = PromoCodeViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: PromoCodeModel) -> () )?
    
    var body: some View {
        ZStack{
            
            VStack {
                
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    
                    
                    Spacer()
                    
                    Text("Promo Code")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
            
            
            
        }
        .onAppear{
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    PromoCodeView()
}
