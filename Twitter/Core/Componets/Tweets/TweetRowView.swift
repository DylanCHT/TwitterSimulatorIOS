//
//  TweetsRowView.swift
//  Twitter
//
//  Created by Dylan  Tao on 7/26/22.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Name")
                            .font(.subheadline.bold())
                        
                        Text("@679")
                            .foregroundColor(Color(.gray))
                            .font(.caption)
                        
                        Text("12W")
                            .foregroundColor(Color(.gray))
                            .font(.caption)
                        
                    }
                    
                    Text("I believe in you")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            HStack {
                Button {
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }.padding(10)
                .foregroundColor(Color(.gray))
            
            Divider()
            
        }.padding(20)
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
