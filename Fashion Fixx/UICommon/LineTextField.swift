//
//  LineTextField.swift
//  Fashion Fixx
//
//  Created by Rasanji Pramodi on 2024-03-11.
//

import SwiftUI

struct LineTextField: View {
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            
            TextField(placholder, text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(8)
                .frame(height:40)

              
            
        }
    }
}

struct LineSecureField: View {
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    
    var body: some View {
        VStack {
            
            if (isShowPassword) {
                TextField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier( ShowButton(isShow: $isShowPassword))
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
                    .frame(height:40)
                
            }else{
                SecureField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier( ShowButton(isShow: $isShowPassword))
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(8)
                    .frame(height:40)
                
            }
        }
    }
}

struct LineTextField_Previews: PreviewProvider {
    @State static  var txt: String = ""
    static var previews: some View {
        LineTextField(txt: $txt)
            .padding(20)
    }
}
