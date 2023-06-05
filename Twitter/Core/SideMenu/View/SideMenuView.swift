//
//  SideMenuView.swift
//  Twitter
//
//  Created by Dylan  Tao on 2/25/23.
//

import SwiftUI

struct SideMenuView: View {
    @State var clicked = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bob Dylan")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("@thedreamer")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStackView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                if option == .profile {
                    NavigationLink {
                        ProfileView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        SideMenuRollView(viewModel: option)
                    }
                    

                } else if option == .logout {
                    Button {
                        viewModel.signOut() 
                        print("Handle Logout !")
                    } label: {
                        SideMenuRollView(viewModel: option)
                    }

                } else {
                    SideMenuRollView(viewModel: option)
                }
                
                
            }
            .padding(.vertical, 4)
            
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}



