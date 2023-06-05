//
//  CustomInputField.swift
//  Twitter
//
//  Created by Dylan  Tao on 5/24/23.
//

import SwiftUI

struct CustomInputField: View {
    
    
//    @Binding var fieldImage: String
//    @Binding var fieldtext: String
    
    let fieldImage: String
    let fieldTextHolder: String
    var isSecureField: Bool? = false
    @Binding var fieldText: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: fieldImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false {
                    SecureField(fieldTextHolder, text: $fieldText)
                } else {
                    TextField(fieldTextHolder, text: $fieldText)
                }
                   
                
            }
            .padding(.bottom, 10)
            
            Divider().background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(fieldImage: "envelope",
                         fieldTextHolder: "Email",
                         isSecureField: false,
                         fieldText: .constant(""))
    }
}
