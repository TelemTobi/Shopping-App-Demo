//
//  Track.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 13/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import Foundation

class Track {
    
    let title: String
    let duration: String
    
    internal init(title: String, duration: String) {
        self.title = title
        self.duration = duration
    }
    
    init(dictionary: [String: String]) {
        title = dictionary["title"]!
        duration = dictionary["duration"]!
    }
}
