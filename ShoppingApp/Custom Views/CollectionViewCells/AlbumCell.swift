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
    
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    private var artistLabel: UILabel!
    
    var fontSize: CGFloat! {
        didSet {
            titleLabel.font = .Jura(ofSize: fontSize, weight: "Bold")
            artistLabel.font = .Jura(ofSize: fontSize - 4, weight: "Medium")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpElements()
        setImageView()
        setTitleLabel()
        setArtistLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpElements() {
        contentView.backgroundColor = .none
    }
    
    private func setImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .primaryColor // remove in future
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    private func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.contentMode = .center
        titleLabel.font = .Jura(ofSize: 16, weight: "Bold")
        titleLabel.textColor = .primaryColor
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.text = "Album name goes here" // remove in future
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
    }
    
    private func setArtistLabel() {
        artistLabel = UILabel()
        artistLabel.font = .Jura(ofSize: 12, weight: "Medium")
        artistLabel.textColor = .lightGray
        artistLabel.textAlignment = .left
        artistLabel.text = "Artist name" // remove in future
        contentView.addSubview(artistLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
    }
}
