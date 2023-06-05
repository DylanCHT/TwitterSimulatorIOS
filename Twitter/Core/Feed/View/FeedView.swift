//
//  FeedView.swift
//  Twitter
//
//  Created by Dylan  Tao on 7/26/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack {
                    ForEach(0 ... 20, id: \.self) { _ in
    //                    Text("Tweet Row View")
                        TweetsRowView()
//                            .padding()
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
                print("post new tweet")
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 60, height: 60)
                    .padding()
            }
            .frame(width: 75, height: 75)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
