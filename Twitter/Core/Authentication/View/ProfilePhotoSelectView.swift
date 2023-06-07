//
//  PhotoSelectView.swift
//  Twitter
//
//  Created by Dylan  Tao on 5/26/23.
//

import SwiftUI

struct ProfilePhotoSelectView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            SignHeader(title1: "Setup account",
                       title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
//                        .scaledToFit()
                        .frame(width: 180, height: 180)
//                        .padding(.top, 44)
                        
                        .clipShape(Circle())
//                        .padding(44)
                } else {
                    Image(systemName: "camera.circle")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                }
            }
            .shadow(color: .gray, radius: 5)
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedIamge: $selectedImage)
            }
            .padding(44)
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                    print("DEBUG: Finishing select profile image")
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

//private struct ProfileImageModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .scaledToFit()
//            .frame(width: 180, height: 180)
//            .clipShape(Circle())
//    }
//}

struct ProfilePhotoSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectView()
    }
}
