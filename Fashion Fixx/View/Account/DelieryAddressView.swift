//
//  DelieryAddressView.swift
//  Fashion Fixx
//
//  Created by Rasanji Pramodi on 2024-03-12.
//

import SwiftUI

struct DelieryAddressView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isPicker: Bool = false
    var didSelect: ((_ obj: AddressModel) -> ())?
    
    var body: some View {
        VStack {
            HeaderView(backAction: {
                presentationMode.wrappedValue.dismiss()
            })
            ScrollViewContent(addressVM: addressVM, isPicker: isPicker, didSelect: didSelect)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

struct HeaderView: View {
    var backAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: backAction) {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Spacer()
                Text("Delivery Address")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(height: 46)
                Spacer()
                NavigationLink {
                    AddDeliveryAddressView()
                } label: {
                    Image("add_temp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .foregroundColor(.primaryText)
                .padding(.bottom, 8)
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.2), radius: 2)
            Spacer()
        }
    }
}

struct ScrollViewContent: View {
    @StateObject var addressVM: DeliveryAddressViewModel
    var isPicker: Bool
    var didSelect: ((_ obj: AddressModel) -> ())?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(addressVM.listArr, id: \.id) { aObj in
                    AddressRowView(aObj: aObj, isPicker: isPicker, didSelect: didSelect, addressVM: addressVM)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets + 60)
        }
        .padding(.top, .topInsets + 46)
    }
}

struct AddressRowView: View {
    var aObj: AddressModel
    var isPicker: Bool
    var didSelect: ((_ obj: AddressModel) -> ())?
    @StateObject var addressVM: DeliveryAddressViewModel
    
    var body: some View {
        HStack(spacing: 15) {
            VStack {
                HStack {
                    Text(aObj.name)
                        .font(.customfont(.bold, fontSize: 14))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Text(aObj.typeName)
                        .font(.customfont(.bold, fontSize: 12))
                        .foregroundColor(.primaryText)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color.secondaryText.opacity(0.3))
                        .cornerRadius(5)
                }
                Text("\(aObj.address), \(aObj.city), \(aObj.state), \(aObj.postalCode)")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundColor(.primaryText)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Text(aObj.phone)
                    .font(.customfont(.bold, fontSize: 12))
                    .foregroundColor(.secondaryText)
                    .padding(.vertical, 8)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            VStack {
                Spacer()
                NavigationLink(
                    destination: AddDeliveryAddressView(isEdit: true, editObj: aObj),
                    label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.primaryColor)
                    }
                )
                .padding(.bottom, 8)
                
                Button(action: {
                    addressVM.serviceCallRemove(cObj: aObj)
                }) {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Spacer()
            }
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.15), radius: 2)
        .onTapGesture {
            if isPicker {
                didSelect?(aObj)
            }
        }
    }
}


#Preview {
    NavigationView {
        DelieryAddressView()
    }
}
