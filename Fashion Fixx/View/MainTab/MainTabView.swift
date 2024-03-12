//
//  MainTabView.swift
//  Fashion Fixx
//
//  Created by Tharaka Mohotti on 2024-03-12.
//

import SwiftUI

struct MainTabView: View {
    
    //@StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack{
            VStack{
//                Spacer()
                
                HStack{
                    Button{
                        MainViewModel.shared.isUserLogin = false
                    }label: {
                        Text("Logout")
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
