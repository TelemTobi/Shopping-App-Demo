//
//  AlbumCell.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 07/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    static let bigCellID = "AlbumBigCell"
    static let smallCellID = "AlbumSmallCell"
    
    private var coverImage: UIImageView!
    private var titleLabel: UILabel!
    private var artistLabel: UILabel!
    
    var album: Album? {
        didSet {
            coverImage.image = album?.image
            titleLabel.text = album?.title
            artistLabel.text = album?.artist.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpElements()
        setCoverImage()
        setTitleLabel()
        setArtistLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpElements() {
        contentView.backgroundColor = .none
    }
    
    private func setCoverImage() {
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFit
        contentView.addSubview(coverImage)
        
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        coverImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        coverImage.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        coverImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    private func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.contentMode = .center
        titleLabel.font = .Jura(ofSize: 16, weight: "Bold")
        titleLabel.textColor = .primaryColor
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
    }
    
    private func setArtistLabel() {
        artistLabel = UILabel()
        artistLabel.font = .Jura(ofSize: 12, weight: "Medium")
        artistLabel.textColor = .lightGray
        artistLabel.textAlignment = .left
        contentView.addSubview(artistLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
    }
}
