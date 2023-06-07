//
//  User.swift
//  Twitter
//
//  Created by Dylan  Tao on 6/5/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
