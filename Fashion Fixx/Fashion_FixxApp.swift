//
//  Fashion_FixxApp.swift
//  Fashion Fixx
//
//  Created by Rasanji Pramodi on 2024-03-11.
//

import SwiftUI

@main
struct Fashion_FixxApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
                
                if mainVM.isUserLogin{
                    MainTabView()
                }else{
                    WelcomeView()
                }
            }
        }
    }
}
