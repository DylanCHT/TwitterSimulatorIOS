//
//  UserRollView.swift
//  Twitter
//
//  Created by Dylan  Tao on 2/24/23.
//

import SwiftUI
import Kingfisher

struct UserRollView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .clipShape(Circle())
                .frame(width: 56, height: 56)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline)
                    .bold()
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRollView_Previews: PreviewProvider {
    static var previews: some View {
        UserRollView(user: User(username: "lalaland", fullname: "L A", profileImageUrl: "", email: "lalaland@gmail.com"))
    }
}
