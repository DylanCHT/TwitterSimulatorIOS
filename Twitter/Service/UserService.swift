//
//  UserService.swift
//  Twitter
//
//  Created by Dylan  Tao on 6/5/23.
//

import Firebase
import FirebaseFirestoreSwift


struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
//                print("DEBUG: Username is: \(user.username)")
//                print("DEBUG: User's email is: \(user.email)")
                completion(user)
                
                // also can be done in this way, but it will return optional type
                
//                if let error = error as NSError? {
//                    print("DEBUG: Error getting document: \(error.localizedDescription)")
//                }
//                else {
//                    if let snapshot = snapshot {
//                        do {
//                            let user = try? snapshot.data(as: User.self)
//                            print("DEBUG: Username is: \(user?.username)")
//                            print("DEBUG: User's email is: \(user?.email)")
//                        }
//                    }
//                }
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        
//        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshots, error in
                guard let documents = snapshots?.documents else { return }
                
                // $0 means each element in that array
                let users = documents.compactMap({ try? $0.data(as: User.self) })
                
//                documents.forEach { document in
//                    guard let user = try? document.data(as: User.self) else { return }
//                    users.append(user)
//                }
                
                completion(users)
            }
    }
}
