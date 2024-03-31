//
//  SignupView.swift
//  Fashion Fixx
//
//  Created by Rasanji Pramodi on 2024-03-11.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            Image("login_bg")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image("logo_trans")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 150)
                    .padding(.bottom, 50)
                
                Text("Signup")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 50)
                
                LineTextField(placholder: "Enter Username", txt: $mainVM.txtUsername)
                    .padding(.bottom, .screenWidth * 0.04)
                
                LineTextField(placholder: "Enter Email Adress", txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.04)
                
                LineSecureField(placholder: "Password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.04)
                
                VStack {
                    Text("By continuing you agree to our")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Text("Terms of Service")
                            .font(.customfont(.medium, fontSize: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.secondaryText)
                        
                        Text(" and ")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                        
                        Text("Privacy Policy.")
                            .font(.customfont(.medium, fontSize: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.secondaryText)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                }
                
                RoundButton(title: "Sign up"){
                    mainVM.serviceCallSignUp()
                }
                
                NavigationLink {
                    LoginView()
                } label: {
                    HStack{
                        Text("Already have an Account?")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Sign in")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryColor)
                    }
                }
                
                Spacer()
            }
            .padding(.top, .topInsets + .screenWidth * 0.1)
            .padding(.horizontal)
            .padding(.bottom, .bottomInsets)
            
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage) , dismissButton: .default(Text("Ok")))
        })
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignupView()
}
