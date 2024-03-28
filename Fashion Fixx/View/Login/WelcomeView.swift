//
//  WelcomeView.swift
//  Fashion Fixx
//
//  Created by Tharaka Mohotti on 2024-03-12.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("wel_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("logo_trans")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 10)
                
                Text( "Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text( "Embrace elegance\nElevate with high-quality clothing")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    LoginView()
                } label: {
                    RoundButton(title: "Get Started") {
                    }
                }

                Spacer()
                    .frame(height: 80)
                
            }
            .padding(.horizontal , 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
        
    
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
