//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Dylan  Tao on 5/24/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
//        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to signin with error \(error.localizedDescription)")
                return
            }

            // guard let: specifically checking that conditions are correct before continuing
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            print("DEBUG: did signin user data..")
        }
        
        print("DEBUG: login with email \(email)")
    }
    func register(withEmail email: String,
                  fullname: String,
                  username: String,
                  password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result , error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }

            // guard let: specifically checking that conditions are correct before continuing
            guard let user = result?.user else { return }
            self.tempUserSession = user

            //set to earily, wait for profile photot select
//            self.userSession = user

//            print("DEBUG: register user successfully")
            print("DEBUG: User is \(self.userSession)")

            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                         "uid": user.uid]

            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
        }
        print("DEBUG: login with email \(email)")
        
    }
    
    func signOut() {
        // back to login view on client end
        userSession = nil
        
        //signs user out in server end
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
