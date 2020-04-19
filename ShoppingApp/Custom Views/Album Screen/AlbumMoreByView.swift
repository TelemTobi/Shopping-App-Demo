//
//  AlbumMoreByView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 18/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumMoreByView: UIView {
    
    private var artistImage: UIImageView!
    private var artistLabel: UILabel!
    private var arrowsImage: UIImageView!
    
    var artist: Artist? {
        didSet {
            artistImage.image = artist?.image
            artistLabel.text = "More by \(artist?.name ?? "")"
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setArtistImage()
        setArrowsImage()
        setArtistLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setArtistImage() {
        artistImage = UIImageView()
        artistImage.contentMode = .scaleAspectFit
        artistImage.layer.cornerRadius = 25
        artistImage.layer.masksToBounds = true
        artistImage.layer.borderWidth = 1
        artistImage.layer.borderColor = UIColor.primaryColor.cgColor
        addSubview(artistImage)
        
        artistImage.translatesAutoresizingMaskIntoConstraints = false
        artistImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        artistImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        artistImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        artistImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        artistImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setArrowsImage() {
        arrowsImage = UIImageView(image: UIImage(named: "arrows"))
        arrowsImage.contentMode = .scaleAspectFit
        addSubview(arrowsImage)
        
        arrowsImage.translatesAutoresizingMaskIntoConstraints = false
        arrowsImage.centerYAnchor.constraint(equalTo: artistImage.centerYAnchor, constant: 4).isActive = true
        arrowsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        arrowsImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        arrowsImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    private func setArtistLabel() {
        artistLabel = UILabel()
        artistLabel.textAlignment = .center
        artistLabel.numberOfLines = 2
        artistLabel.backgroundColor = .myBackgroundColor
        artistLabel.textColor = .primaryColor
        artistLabel.font = .Jura(ofSize: 18, weight: "Bold")
        addSubview(artistLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.centerYAnchor.constraint(equalTo: artistImage.centerYAnchor, constant: 4).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 12).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: arrowsImage.leadingAnchor, constant: -16).isActive = true
    }
}
