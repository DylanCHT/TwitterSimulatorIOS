//
//  ExploreView.swift
//  Twitter
//
//  Created by Dylan  Tao on 7/27/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0...25, id: \.self ) { _ in
                            NavigationLink{
                                ProfileView()
                            } label: {
                                UserRollView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
