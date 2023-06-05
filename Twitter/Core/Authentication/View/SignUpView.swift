//
//  SignUpView.swift
//  Twitter
//
//  Created by Dylan  Tao on 3/17/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {

            NavigationLink(destination: ProfilePhotoSelectView(),
                            isActive: $viewModel.didAuthenticateUser,
                           label: {})
            
            SignHeader(title1: "Get started", title2: "Create your account")
            
            VStack(spacing: 40){
                CustomInputField(fieldImage: "envelope",
                                 fieldTextHolder: "Email",
                                 fieldText: $email)
                
//                CustomInputField(fieldImage: "person",
//                                 fieldTextHolder: "Username",
//                                 fieldText: $username)
//
//                CustomInputField(fieldImage: "person",
//                                 fieldTextHolder: "Full Name",
//                                 fieldText: $fullName)

                CustomInputField(fieldImage: "lock",
                                 fieldTextHolder: "Password",
                                 isSecureField: true,
                                 fieldText: $password)
                
            }
//            .padding(.horizontal, 32)
//            .padding(.top, 44)
            .padding(32)
            
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password
//                                   fullname: fullName,
//                                   username: username
                )
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)

            Spacer()
            

            Button{
//                SignUpView()
//                    .navigationBarHidden(true)
                // back to first layer >> login View
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack() {
                    Text("Already have a account?")
                        .font(.caption)
                    
                    Text("Sign In")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 32)
                .foregroundColor(Color(.systemBlue))
            }
        }
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
