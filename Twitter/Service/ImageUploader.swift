//
//  ImageUploader.swift
//  Twitter
//
//  Created by Dylan  Tao on 5/30/23.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Faileed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, error in
                if let error = error {
                    print("DEBUG: Faileed to download image with error: \(error.localizedDescription)")
                    return
                } else {
                    guard let imageUrl = imageUrl?.absoluteString else { return }
                    completion(imageUrl)
                }
            }
        }
    }
}
