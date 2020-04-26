//
//  ShopCollectionView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 07/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ShopCollectionView: UICollectionViewController {
    
    var delegate: AlbumDelegate?
    
    var selectedGenre: Int = 0 {
        willSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        collectionView.backgroundColor = .none
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.smallCellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albumsByGenre[selectedGenre].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.smallCellID, for: indexPath) as! AlbumCell
        cell.album = albumsByGenre[selectedGenre][indexPath.row]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectAlbum(albumsByGenre[selectedGenre][indexPath.row])
    }
    
    func reset() {
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .top, animated: false)
    }
}
