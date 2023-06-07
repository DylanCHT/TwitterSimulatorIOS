//
//  ProfileView.swift
//  Twitter
//
//  Created by Dylan  Tao on 7/27/22.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack(alignment: .leading) {

            HeaderView
            
            ActionButtons
            
            UserInfoView
            
            TweetFilterBar
            
            TweetScrollView
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(username: "lalaland", fullname: "L A", profileImageUrl: "", email: "whatland@gmail.com"))
    }
}


extension ProfileView {
    var HeaderView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(Color(. white))
                        .offset(x: 12, y: 12)
                }
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 12, y: 35)
            }
            
        }.frame(height: 90)
    }
    
    var ActionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Edit Proflie")
                    .font(.subheadline.bold())
                    .frame(width: 120, height: 32)
                    .foregroundColor(Color.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }.padding(.trailing)
    }
    
    var UserInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(user.fullname)
                    .font(.title2.bold())
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Keep dreaming")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        
                    Text("All around the world")
                }

                HStack {
                    Image(systemName: "link")
                        
                    Text("www.smillingface.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStackView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var TweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .black : .gray)
                        .offset(y: selectionFilter == item ? -6.0 : 0.0)
                    if selectionFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectionFilter = item
                    }
                }
            }
        }.overlay(Divider().offset(x:0, y:10))
    }
    
    var TweetScrollView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...9, id: \.self) { _ in
                     TweetsRowView()
                }
            }
        }
    }
}
