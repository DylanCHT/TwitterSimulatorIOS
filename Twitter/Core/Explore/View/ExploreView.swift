//
//  ExploreView.swift
//  Twitter
//
//  Created by Dylan  Tao on 7/27/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var exploreViewModel = ExploreViewModel()
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $exploreViewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(exploreViewModel.searchableUsers) { user in
                        NavigationLink{
                            ProfileView(user: user)
                        } label: {
                            UserRollView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
