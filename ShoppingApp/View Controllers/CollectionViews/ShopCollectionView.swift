//
//  ShopCollectionView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 07/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ShopCollectionView: UICollectionViewController {
    
    var selectedGenre: Int! {
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
        8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.smallCellID, for: indexPath) as! AlbumCell
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
    }
}
