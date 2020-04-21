//
//  Artist.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 13/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class Artist {
    
    let id: String
    let name: String
    let albums: [String]
    let image: UIImage

    internal init(id: String, name: String, albums: [String], image: UIImage) {
        self.id = id
        self.name = name
        self.albums = albums
        self.image = image
    }
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as! String
        name = dictionary["name"] as! String
        albums = dictionary["albums"] as! [String]
        image = UIImage(named: id) ?? UIImage(named: "kendrick")!
    }
}
