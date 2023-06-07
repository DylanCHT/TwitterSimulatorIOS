//
//  SideMenuView.swift
//  Twitter
//
//  Created by Dylan  Tao on 2/25/23.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
//    @State var clicked = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text("@\(user.username)")
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
                            ProfileView(user: user)
//                                .navigationBarBackButtonHidden(true)
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
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}



