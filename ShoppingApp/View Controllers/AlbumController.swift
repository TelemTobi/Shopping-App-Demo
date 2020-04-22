//
//  AlbumController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 13/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumController: UIViewController {
    
    var topView: AlbumTopView!
    var detailsView: AlbumDetailsView!
    var moreByView: AlbumMoreByView!
    var tracklistView: AlbumTracklistView!
    var trackCollectionView: TracksCollectionView!
    
    var delegate: AlbumDelegate?
    var backButton: UIButton!
    var cartButton: UIButton!
    
    var topViewHeightAnchor: NSLayoutConstraint!
    
    var album: Album? {
        didSet {
            topView.album = album
            detailsView.album = album
            moreByView.artist = demoArtists[album?.artist ?? ""]
            trackCollectionView.tracks = album?.tracks
        }
    }
    
    var isCollapsed: Bool = false {
        willSet {
            guard isCollapsed != newValue else { return }
            
            topViewHeightAnchor.constant = newValue ? UIScreen.main.bounds.height * 0.14 : UIScreen.main.bounds.height * 0.37
            UIView.animate(withDuration: 0.5, animations: {
                self.topView.shouldCollapse(newValue)
                self.tracklistView.alpha = newValue ? 0 : 1
                self.trackCollectionView.view.alpha = newValue ? 1 : 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        setTopView()
        setDetailsView()
        setMoreByView()
        setBackButton()
        setCartButton()
        setTracklistView()
        setTracksCollectionView()
        setGestures()
    }
    
    private func setUpElements() {
        view.backgroundColor = .myBackgroundColor
    }
    
    private func setGestures() {
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUp(_:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDown(_:)))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
    }
    
    @objc private func handleSwipeUp(_ swipe: UIGestureRecognizer) {
        if !isCollapsed {
            isCollapsed = true
        }
    }
    
    @objc private func handleSwipeDown(_ swipe: UISwipeGestureRecognizer) {
        if isCollapsed {
            isCollapsed = false
        }
    }
    
    private func setTopView() {
        topView = AlbumTopView()
        view.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topViewHeightAnchor = topView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.37)
        topViewHeightAnchor.isActive = true
    }

    private func setDetailsView() {
        detailsView = AlbumDetailsView()
        view.addSubview(detailsView)
        
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 16).isActive = true
        detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setMoreByView() {
        moreByView = AlbumMoreByView()
        view.addSubview(moreByView)
        
        moreByView.translatesAutoresizingMaskIntoConstraints = false
        moreByView.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 16).isActive = true
        moreByView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        moreByView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        moreByView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setBackButton() {
        backButton = UIButton(type: .custom)
        backButton.backgroundColor = .none
        backButton.setImage(UIImage(named: "back-arrow"), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    @objc func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    private func setCartButton() {
        cartButton = UIButton(type: .custom)
        cartButton.backgroundColor = .secondaryColor
        cartButton.setImage(UIImage(named: "shopping-cart"), for: .normal)
        cartButton.imageView?.contentMode = .scaleAspectFit
        cartButton.layer.cornerRadius = 27.5
        cartButton.layer.borderWidth = 1
        cartButton.layer.borderColor = UIColor.myBackgroundColor.cgColor
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        view.addSubview(cartButton)
        
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cartButton.centerYAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        cartButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        cartButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func setTracklistView() {
        tracklistView = AlbumTracklistView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSwipeUp(_:)))
        tracklistView.addGestureRecognizer(tapGesture)
        view.addSubview(tracklistView)
        
        tracklistView.translatesAutoresizingMaskIntoConstraints = false
        tracklistView.topAnchor.constraint(equalTo: moreByView.bottomAnchor, constant: 8).isActive = true
        tracklistView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        tracklistView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tracklistView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setTracksCollectionView() {
        let layout = LayoutsManager.shared.tracksLayout()
        trackCollectionView = TracksCollectionView(collectionViewLayout: layout)
        trackCollectionView.view.alpha = 0
        view.addSubview(trackCollectionView.view)
        
        trackCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        trackCollectionView.view.topAnchor.constraint(equalTo: moreByView.bottomAnchor, constant: 24).isActive = true
        trackCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        trackCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        trackCollectionView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
    
    @objc private func cartButtonTapped() {
        guard let id = album?.id else { return }
        CartManager.shared.addItemToCart(id)
    }
    
    func willAppear(_ album: Album) {
        self.album = album
        topView.animateVinyl()
    }
    
    func didDisappear() {
        topView.reset()
        trackCollectionView.reset()
        isCollapsed = false
    }
}
