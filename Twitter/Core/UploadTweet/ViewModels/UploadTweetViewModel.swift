//
//  UploadTweetViewModel.swift
//  Twitter
//
//  Created by Dylan  Tao on 6/7/23.
//

import Foundation

class uploadTweetViewModel: ObservableObject {
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.upLoadTweet(caption: caption)
        
    }
}
