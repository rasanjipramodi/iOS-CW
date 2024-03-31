//
//  AddPaymentMethodView.swift
//  Fashion Fixx
//
//  Created by Rasanji Pramodi on 2024-03-12.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    
    
    var body: some View {
        ZStack {
            
            ScrollView{
                VStack(spacing: 15){
                    
                                        
                    
                    LineTextField(placholder: "Enter you name" , txt: $payVM.txtName)
                    
                    LineTextField(placholder: "Enter card number", txt: $payVM.txtCardNumber, keyboardType: .numberPad)
                    
                   
                    
                    HStack{
                        LineTextField(placholder: "Enter Month" , txt: $payVM.txtCardMonth, keyboardType: .numberPad)
                        
                        LineTextField(placholder: "Enter Year" , txt: $payVM.txtCardYear, keyboardType: .numberPad)
                    }
                   
                    
                    RoundButton(title:  "Add Payment Method") {
                        
                            payVM.serviceCallAdd {
                                self.mode.wrappedValue.dismiss()
                            }
                        
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)

            }
            
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
                    
                    Text("Add Payment Method")
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
        
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    AddPaymentMethodView()
}
