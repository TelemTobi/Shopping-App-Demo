//
//  ShopController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 05/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ShopController: UIViewController {
    
    var genresCollectionView: GenresCollectionView!
    var shopCollectionView: ShopCollectionView!
    var albumController: AlbumController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        setGenresCollectionView()
        setShopCollectionView()
    }
    
    func setUpElements() {
        albumController = setAlbumController()
        albumController.delegate = self
        view.backgroundColor = .myBackgroundColor
    }
    
    func setGenresCollectionView() {
        let layout = LayoutsManager.shared.genresLayout()
        genresCollectionView = GenresCollectionView(collectionViewLayout: layout)
        genresCollectionView.shopDelegate = self
        
        addChild(genresCollectionView)
        genresCollectionView.didMove(toParent: self)
        view.addSubview(genresCollectionView.view)
        
        genresCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        genresCollectionView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        genresCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        genresCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        genresCollectionView.view.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        genresCollectionView.view.addBottomBorder(with: .primaryColor, andWidth: 3)
    }
    
    func setShopCollectionView() {
        let layout = LayoutsManager.shared.shopLayout()
        shopCollectionView = ShopCollectionView(collectionViewLayout: layout)
        shopCollectionView.delegate = self
        
        addChild(shopCollectionView)
        shopCollectionView.didMove(toParent: self)
        view.addSubview(shopCollectionView.view)
        
        shopCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        shopCollectionView.view.topAnchor.constraint(equalTo: genresCollectionView.view.bottomAnchor).isActive = true
        shopCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        shopCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shopCollectionView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ShopController: GenresDelegate {
    func didSelectGenre(_ genre: Int) {
        
        shopCollectionView.selectedGenre = genre
    }
}

extension ShopController: AlbumDelegate {
    func didSelectAlbum(_ album: Album?) {
        albumController.willAppear(album ?? testAlbum)
        
        genresCollectionView.view.isHidden = true
        shopCollectionView.view.isHidden = true
        albumController.view.isHidden = false
    }
    
    func didSelectArtist(_ artist: Artist?) {
        
    }
    
    func backButtonTapped() {
        guard albumController.view.isHidden == false else { return }
        genresCollectionView.view.isHidden = false
        shopCollectionView.view.isHidden = false
        albumController.view.isHidden = true
        
        albumController.didDisappear()
    }
}
