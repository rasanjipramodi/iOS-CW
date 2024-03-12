//
//  LoginView.swift
//  Fashion Fixx
//
//  Created by Tharaka Mohotti on 2024-03-11.
//

import SwiftUI

struct LoginView: View {

    @StateObject var loginVM = MainViewModel.shared;
    
    var body: some View {
        ZStack {
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
                    .padding(.bottom, 100)
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 50)
                
                LineTextField(placholder: "Enter Email Adress", txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.04)
                
                LineSecureField(placholder: "Password", txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                NavigationLink {
                    ForgotPasswordView()
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundButton(title: "Log in"){
                    loginVM.serviceCallLogin()
                }
                
                NavigationLink {
                    SignupView()
                } label: {
                    HStack{
                        Text("Don’t have an Account?")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Sign up")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryColor)
                    }
                }
                
                Spacer()
            }
            .padding(.top, .topInsets + .screenWidth * 0.1)
            .padding(.horizontal)
            .padding(.bottom, .bottomInsets)
        }
        .alert(isPresented: $loginVM.showError) {
                
            Alert(title: Text(Globs.AppName), message: Text( loginVM.errorMessage ), dismissButton: .default(Text("Ok")))
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
