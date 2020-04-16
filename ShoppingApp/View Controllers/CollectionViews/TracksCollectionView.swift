//
//  TracksCollectionView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 16/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class TracksCollectionView: UICollectionViewController {
    
    var tracks: [Track]?  {
           didSet {
               DispatchQueue.main.async {
                   self.collectionView.reloadData()
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpElements()
    }
    
    func setUpElements() {
        collectionView.backgroundColor = .myBackgroundColor
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tracks?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.id, for: indexPath) as! TrackCell
        cell.indexLabel.text = (indexPath.row + 1).description
        cell.track = tracks?[indexPath.row]
        return cell
    }
}
