//
//  BrowseCollectionView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 07/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class BrowseCollectionView: UICollectionViewController {
    
    var delegate: AlbumDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        collectionView.backgroundColor = .none
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.smallCellID)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.bigCellID)
        collectionView.register(ArtistCell.self, forCellWithReuseIdentifier: ArtistCell.id)
        collectionView.register(BrowseSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BrowseSectionHeader.id)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.smallCellID, for: indexPath) as! AlbumCell
            cell.album = demoAlbums.randomElement()?.value
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.bigCellID, for: indexPath) as! AlbumCell
            cell.album = demoAlbums.randomElement()?.value
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCell.id, for: indexPath) as! ArtistCell
            cell.artist = demoArtists.randomElement()?.value
            return cell
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? AlbumCell
        switch indexPath.section {
        case 0:
            delegate?.didSelectAlbum(cell?.album ?? testAlbum)
        case 1:
            delegate?.didSelectAlbum(cell?.album ?? testAlbum)
        default:
            delegate?.didSelectArtist(testArtist)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BrowseSectionHeader.id, for: indexPath) as! BrowseSectionHeader
        switch indexPath.section {
        case 0:
            header.title = "Most Popular Albums"
        case 1:
            header.title = "New Releases"
        default:
            header.title = "Shop by Artist"
        }
        return header
    }
}
