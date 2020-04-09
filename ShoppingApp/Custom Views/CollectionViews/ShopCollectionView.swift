//
//  CollectionViewController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 07/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ShopCollectionView: UICollectionViewController {
    
    var selectedGenre: Int! {
        willSet {
            let header = collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: 1)) as! ShopSectionHeader
            header.title = "Top \(musicGenres[newValue].0) Albums"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        collectionView.backgroundColor = .none
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.id)
        collectionView.register(ArtistCell.self, forCellWithReuseIdentifier: ArtistCell.id)
        collectionView.register(ShopSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ShopSectionHeader.id)
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCell.id, for: indexPath) as! ArtistCell
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.id, for: indexPath) as! AlbumCell
            return cell
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ShopSectionHeader.id, for: indexPath) as! ShopSectionHeader
        switch indexPath.section {
        case 0:
            header.title = "New Releases"
        case 1:
            header.title = "Top Pop Albums"
        case 2:
            header.title = "Shop by Artist"
        default:
            break
        }
        return header
    }
}
