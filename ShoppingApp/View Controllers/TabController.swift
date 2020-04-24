//
//  TabController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 24/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class TabController: UIViewController {
    
    var albumController: AlbumController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumController = setAlbumController()
        albumController.delegate = self
        
        view.backgroundColor = .myBackgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.bringSubviewToFront(albumController.view)
    }
}

extension TabController: AlbumDelegate {
    func didSelectAlbum(_ album: Album?) {
        albumController.willAppear(album ?? testAlbum)
        albumController.view.isHidden = false
    }
    
    func didSelectArtist(_ artist: Artist?) {
        
    }
    
    func backButtonTapped() {
        guard albumController.view.isHidden == false else { return }
        albumController.view.isHidden = true
        albumController.didDisappear()
    }
}
