//
//  NewTweetView.swift
//  Twitter
//
//  Created by Dylan  Tao on 3/13/23.
//

import SwiftUI

struct NewTweetView: View {
    
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Tweet")
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(Color(.white))
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                    //                        .cornerRadius(20)
                }
            }
//            .padding(.horizontal, 20)
            .padding()
            
            HStack(alignment: .top) {
               Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's new ?", text: $caption)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
