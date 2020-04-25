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
        albumController.view.center.x = view.frame.width * 1.5
        albumController.delegate = self
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.require(toFail: albumController.upSwipe)
        panGesture.require(toFail: albumController.downSwipe)
        albumController.view.addGestureRecognizer(panGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGesture.direction = .right
        albumController.view.addGestureRecognizer(swipeGesture)
    }
}

extension TabController: AlbumDelegate {
    func didSelectAlbum(_ album: Album?) {
        albumController.willAppear(album ?? testAlbum)
        albumController.view.isHidden = false
        animateAlbumView(false)
    }
    
    func didSelectArtist(_ artist: Artist?) {
        
    }
    
    func backButtonTapped() {
        animateAlbumView(true)
        albumController.didDisappear()
    }
}

extension TabController: UIGestureRecognizerDelegate {
    
    @objc func handleSwipeGesture(_ recognizer: UISwipeGestureRecognizer) {
        animateAlbumView(true)
    }
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            if let albumView = recognizer.view, albumView.center.x >= view.frame.width / 2 {
              albumView.center.x = albumView.center.x + recognizer.translation(in: view).x
              recognizer.setTranslation(CGPoint.zero, in: view)
            }
        case .ended:
            guard let albumView = recognizer.view else { return }
            let hasMovedGreaterThanHalfway = albumView.center.x > view.bounds.size.width
            animateAlbumView(hasMovedGreaterThanHalfway)
        default:
            break
        }
    }
    
    func animateAlbumView(_ shouldHide: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            self.albumController.view.center.x = shouldHide ? self.view.frame.width * 1.5 : self.view.frame.width / 2
        }) { (didFinish) in
            self.albumController.view.isHidden = shouldHide ? true : false
        }
    }
}
