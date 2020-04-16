//
//  Album.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 13/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

struct Album {
    let id: String
    let title: String
    let artist: Artist
    let genre: Int
    let image: UIImage
    let price: Float
    let tracks: [Track]
    let releaseDate: String
    let notes: String
}
