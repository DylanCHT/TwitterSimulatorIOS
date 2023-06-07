//
//  LoginView.swift
//  Twitter
//
//  Created by Dylan  Tao on 3/17/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var  viewModel: AuthViewModel
    
    var body: some View {
        // parent container
        VStack {
            
            // head View
            
            SignHeader(title1: "Hello,", title2: "Welcome back !")

            VStack(spacing: 40) {
//                TextField("Email", text: $email)
                CustomInputField(fieldImage: "envelope",
                                 fieldTextHolder: "Email",
                                 fieldText: $email)
//                TextField("Password", text: $password)

                CustomInputField(fieldImage: "lock",
                                 fieldTextHolder: "Password",
//                                 isSecureField: true,
                                 fieldText: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack() {
                
                Spacer()
                NavigationLink{
                    Text("Forget Password")
                } label: {
                    Text("Forget Password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
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
            

            NavigationLink{
                SignUpView()
                    .navigationBarHidden(true)
            } label: {
                HStack() {
                    Text("Don't have a account?")
                        .font(.caption)
                    
                    Text("Sign Up")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 32)
                .foregroundColor(Color(.systemBlue))
            }
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
