//
//  UserStackView.swift
//  Twitter
//
//  Created by Dylan  Tao on 2/25/23.
//

import SwiftUI

struct UserStackView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack {
                Text("2")
                    .bold()
                    .foregroundColor(.black)
                Text("followings")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            HStack {
                Text("2M")
                    .bold()
                    .foregroundColor(.black)
                Text("followers")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStackView_Previews: PreviewProvider {
    static var previews: some View {
        UserStackView()
    }
}
