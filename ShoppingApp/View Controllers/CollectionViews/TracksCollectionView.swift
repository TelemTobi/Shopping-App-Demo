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
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.primaryColor.cgColor
        view.layer.cornerRadius = 10
        
        collectionView.backgroundColor = .myBackgroundColor
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: TrackCell.id)
        collectionView.register(BasicSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BasicSectionHeader.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tracks?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCell.id, for: indexPath) as! TrackCell
        cell.indexLabel.text = (indexPath.row + 1).description
        cell.track = tracks?[indexPath.row]
        cell.handleSeperator(shouldHide: (indexPath.item + 1) % 3 == 0 || indexPath.item == tracks!.count - 1)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BasicSectionHeader.id, for: indexPath) as! BasicSectionHeader
        header.title = "Tracklist"
        return header
    }
    
    func reset() {
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
}
