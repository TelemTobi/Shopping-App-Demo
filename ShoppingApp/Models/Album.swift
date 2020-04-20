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
    let artist: Artist?
    let genre: Int
    let image: UIImage
    let price: Float
    let tracks: [Track]
    let releaseDate: String
    let notes: String
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as! String
        title = dictionary["title"] as! String
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
        
        
        artist = testArtist
    }
}
