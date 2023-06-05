//
//  MainTabView.swift
//  Twitter
//
//  Created by Dylan  Tao on 7/27/22.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIdx = 0
    
    var body: some View {
        TabView(selection: $selectedIdx) {
            FeedView()
                .onTapGesture{
                    self.selectedIdx = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            ExploreView()
                .onTapGesture{
                    self.selectedIdx = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            NotificationView()
                .onTapGesture{
                    self.selectedIdx = 2
                }
                .tabItem {
                    Image(systemName: "bell.fill")
                }.tag(2)
        
            MessagesView()
                .onTapGesture{
                    self.selectedIdx = 3
                }
                .tabItem {
                    Image(systemName: "envelope.fill")
                }.tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
