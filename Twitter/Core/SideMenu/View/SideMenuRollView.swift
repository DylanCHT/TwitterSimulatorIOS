//
//  SideMenuRollView.swift
//  Twitter
//
//  Created by Dylan  Tao on 2/25/23.
//

import SwiftUI

struct SideMenuRollView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
            HStack() {
                Image(systemName: viewModel.imageName)
                        .font(.headline)
                        .foregroundColor(.gray)
                
                Text(viewModel.description)
                    .foregroundColor(.black)
                    .font(.subheadline)
                
                Spacer()
            }
            .frame(height: 40)
            .padding(.horizontal)
    }
}

struct SideMenuRollView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRollView(viewModel: .profile)
    }
}
