//
//  Constants.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 05/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

struct TabItems {
    static let titles = ["Genres", "Browse", "Cart"]
    static let images = [UIImage(systemName: "music.note"), UIImage(systemName: "bag"), UIImage(systemName: "cart")]
    static let selectedImages = [UIImage(systemName: "music.note"), UIImage(systemName: "bag.fill"), UIImage(systemName: "cart.fill")]
}

let musicGenres: [(String, UIImage)] = [
    ("Pop", UIImage(named: "pop")!),
    ("R&B", UIImage(named: "rnb")!),
    ("Rock", UIImage(named: "rock")!),
    ("Rap", UIImage(named: "rap")!),
    ("Electronic", UIImage(named: "electronic")!),
    ("Blues", UIImage(named: "blues")!)
]

let testArtist = Artist(id: "0", name: "Kendrick Lamar", albums: [], genre: 3, image: UIImage(named: "kendrick")!)

let testAlbum = Album(id: "0", title: "To Pimp a Butterfly",
                      artist: testArtist,
                      genre: 3,
                      image: UIImage(named: "album-cover")!,
                      price: 15.0,
                      tracks: Array(repeating: Track(title: "Mortal Man", duration: "4:20"), count: 16),
                      releaseDate: "March 15, 2015",
                      notes: "To Pimp a Butterfly is the third studio album by American rapper Kendrick Lamar.                                                                        It was released on March 15, 2015, by Top Dawg Entertainment, distributed by Aftermath Entertainment and Interscope Records"
                )
