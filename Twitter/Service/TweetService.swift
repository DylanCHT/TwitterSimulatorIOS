//
//  TweetService.swift
//  Twitter
//
//  Created by Dylan  Tao on 6/6/23.
//

import Firebase

struct TweetService {
    
    func upLoadTweet(caption: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timeStamp": Timestamp(date: Date())
        ] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { _ in
                print("DEBUG: Did upload tweet..")
            }
    }
}
