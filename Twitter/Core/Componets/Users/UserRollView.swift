//
//  UserRollView.swift
//  Twitter
//
//  Created by Dylan  Tao on 2/24/23.
//

import SwiftUI

struct UserRollView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
                .foregroundColor(.black)
            VStack{
                Text("WhatLAND")
                    .font(.subheadline)
                    .bold()
                Text("LALALALA")
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
        UserRollView()
    }
}
