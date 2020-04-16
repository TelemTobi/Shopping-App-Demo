//
//  GenresCollectionView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 08/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class GenresCollectionView: UICollectionViewController {
    
    var shopDelegate: GenresDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpElements()
    }
    
    func setUpElements() {
        collectionView.backgroundColor = .none
        collectionView.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.id)
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.id, for: indexPath) as! GenreCell
        cell.genre = musicGenres[indexPath.item]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shopDelegate.didSelectGenre(indexPath.item)
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            cell.transform = .identity
        }, completion: nil)
    }

}
