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
