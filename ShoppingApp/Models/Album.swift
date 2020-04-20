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
    let artist: String
    let genre: Int
    let image: UIImage
    let price: Float
    let tracks: [Track]
    let releaseDate: String
    let notes: String
    
    internal init(id: String, title: String, artist: String, genre: Int, image: UIImage, price: Float, tracks: [Track], releaseDate: String, notes: String) {
        self.id = id
        self.title = title
        self.artist = artist
        self.genre = genre
        self.image = image
        self.price = price
        self.tracks = tracks
        self.releaseDate = releaseDate
        self.notes = notes
    }
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as! String
        title = dictionary["title"] as! String
        artist = dictionary["artist"] as! String
        genre = dictionary["genre"] as! Int
        image = UIImage(named: id)!
        price = dictionary["price"] as! Float
        releaseDate = dictionary["releaseDate"] as! String
        notes = dictionary["notes"] as! String
        
        var tracks: [Track] = []
        let dictionaryTracks = dictionary["tracks"] as! [[String: String]]
        dictionaryTracks.forEach {
            tracks.append(Track(dictionary: $0))
        }
        self.tracks = tracks
    }
}
