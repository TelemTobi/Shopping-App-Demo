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
var albumsByGenre: [[Album]]!
var browseData: [[Any]] = Array(repeating: [], count: 3)

class DemoDataManager {
    
    static let shared = DemoDataManager()
    private init(){}
    
    func setup() {
        setDemoAlbums()
        setDemoArtists()
        splitByGenres()
        setBrowseDemoData()
    }
    
    private func setDemoAlbums() {
        guard
          let URL = Bundle.main.url(forResource: "DemoAlbums", withExtension: "plist"),
          let albumsFromPlist = NSArray(contentsOf: URL) as? [[String: Any]]
          else {
            return
        }
        for dictionary in albumsFromPlist {
            let album = Album(dictionary: dictionary)
            demoAlbums[album.id] = album
        }
    }
    
    private func setDemoArtists() {
        guard
          let URL = Bundle.main.url(forResource: "DemoArtists", withExtension: "plist"),
          let artistsFromPlist = NSArray(contentsOf: URL) as? [[String: Any]]
          else {
            return
        }
        
        for dictionary in artistsFromPlist {
            let artist = Artist(dictionary: dictionary)
            demoArtists[artist.id] = artist
        }
    }
    
    private func splitByGenres() {
        albumsByGenre = Array(repeating: [], count: musicGenres.count)
        demoAlbums.forEach {
            albumsByGenre[$0.value.genre].append($0.value)
        }
    }
    
    private func setBrowseDemoData() {
        for i in 0..<browseData.count {
            for _ in 0...7 {
                browseData[i].append(i == 2 ? demoArtists.randomElement()!.value : demoAlbums.randomElement()!.value)
            }
        }
    }
}
