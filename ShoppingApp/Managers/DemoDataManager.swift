//
//  DataManager.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 20/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

var demoAlbums: [String: Album] = [:]
var demoArtists: [String: Artist] = [:]

class DemoDataManager {
    
    static let shared = DemoDataManager()
    private init(){}
    
    func setup() {
        guard
          let URL = Bundle.main.url(forResource: "Albums", withExtension: "plist"),
          let albumsFromPlist = NSArray(contentsOf: URL) as? [[String: Any]]
          else {
            return
        }
        for dictionary in albumsFromPlist {
            let album = Album(dictionary: dictionary)
            demoAlbums[album.id] = album
        }
    }
}
