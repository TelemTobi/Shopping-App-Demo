//
//  Protocols.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 13/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

protocol GenresDelegate {
    func didSelectGenre(_ genre: Int)
}

protocol AlbumDelegate {
    func didSelectAlbum(_ album: Album?)
    func didSelectArtist(_ artist: Artist?)
    func backButtonTapped()
}


