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
        
        configureAlbumController()
        view.backgroundColor = .myBackgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.bringSubviewToFront(albumController.view)
    }
    
    func configureAlbumController() {
        albumController = setAlbumController()
        albumController.delegate = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.require(toFail: albumController.upSwipe)
        panGesture.require(toFail: albumController.downSwipe)
        albumController.view.addGestureRecognizer(panGesture)
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

extension TabController: UIGestureRecognizerDelegate {
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        guard (recognizer.velocity(in: view).x > 0), !albumController.view.isHidden else { return }
        
        switch recognizer.state {
        case .began:
            print("began")
        case .changed:
            print("changed")
        case .ended:
            print("ended")
        default:
            break
        }
    }
}
