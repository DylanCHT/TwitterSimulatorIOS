//
//  SignHeader.swift
//  Twitter
//
//  Created by Dylan  Tao on 5/24/23.
//

import SwiftUI

struct SignHeader: View {
    
    let title1: String
    let title2: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(title1)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text(title2)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .padding(.leading)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 260)
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(RoundedShape(corner: .bottomRight))
            .shadow(color: .gray.opacity(0.6), radius: 70)
        }
    }
}

struct SignHeader_Previews: PreviewProvider {
    static var previews: some View {
        SignHeader(title1: "Hi", title2: "User")
    }
}
