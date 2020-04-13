//
//  Album.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 13/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import Foundation

struct Album {
    let title: String
    let artist: Artist
    let genre: Int
    
    let records: Int
    let tracks: [Track]
    let releaseDate: Date
    let notes: String
}
