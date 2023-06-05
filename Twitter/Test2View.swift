//
//  Test2View.swift
//  Twitter
//
//  Created by Dylan  Tao on 8/17/22.
//

import SwiftUI

struct Test2View: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                
                
                Image(systemName: "chevron.up")
                    .resizable()
                    .foregroundColor(Color.black)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 212, height: 212)
                    .clipped()
                
                Spacer()
                
                Text("Cool! Please give back the phone\n ").font(.custom("Gilroy ExtraBold", size: 40)).foregroundColor(Color(#colorLiteral(red: 0.08, green: 0.08, blue: 0.08, alpha: 1))).lineSpacing(20)
                
                Spacer()
                
                Button(action: {
                }, label: {
                    
                    Text("Yes, It's me")
                        .font(.custom("Gilroy-ExtraBold", size: 40))
                        .padding([.horizontal], 50)
                        .padding(20)
                        .background(Color(#colorLiteral(red: 0.9333333373069763, green: 0.9333333373069763, blue: 0.9333333373069763, alpha: 1)))
                        .cornerRadius(40)
                        .foregroundColor(.black)
                    
                })
                Spacer()
            }
        }
    }
}

struct Test2View_Previews: PreviewProvider {
    static var previews: some View {
        Test2View()
    }
}
