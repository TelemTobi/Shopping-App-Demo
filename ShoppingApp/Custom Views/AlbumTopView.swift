//
//  AlbumTopView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 13/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumTopView: UIView {
    
    private var backgroundImage: UIImageView!
    private var coverImage: UIImageView!
    private var vinylImage: UIImageView!
    private var titleLabel: UILabel!
    private var artistLabel: UILabel!
    private var priceLabel: UILabel!
    
    private var coverImagerCenterX: NSLayoutConstraint!
    private var vinylImageCenterX: NSLayoutConstraint!
    
    var album: Album? {
        didSet {
            backgroundImage.image = album?.image
            coverImage.image = album?.image
            titleLabel.text = album?.title
            artistLabel.text = album?.artist.name
            priceLabel.text = " \(album?.price.description ?? "15.0")$ "
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setBackgroundImage()
        setVinylImage()
        setCoverImage()
        setTitleLabel()
        setArtistLabel()
        setPriceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackgroundImage() {
        backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.backgroundColor = .primaryColor // remove in future
        addSubview(backgroundImage)
        self.constraintToBounds(backgroundImage)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        addSubview(blurEffectView)
        self.constraintToBounds(blurEffectView)
    }
    
    private func setVinylImage() {
        vinylImage = UIImageView(image: UIImage(named: "vinyl_record"))
        vinylImage.contentMode = .scaleAspectFit
        addSubview(vinylImage)
        
        vinylImage.translatesAutoresizingMaskIntoConstraints = false
        vinylImageCenterX = vinylImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 8)
        vinylImageCenterX.isActive = true
        vinylImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -28).isActive = true
        vinylImage.widthAnchor.constraint(equalToConstant: 165).isActive = true
        vinylImage.heightAnchor.constraint(equalToConstant: 165).isActive = true
    }
    
    private func setCoverImage() {
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFit
        coverImage.backgroundColor = .primaryColor // remove in future
        addSubview(coverImage)
        
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImagerCenterX = coverImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -32)
        coverImagerCenterX.isActive = true
        coverImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32).isActive = true
        coverImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        coverImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    private func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.font = .Jura(ofSize: 20, weight: "Bold")
        titleLabel.textColor = .myBackgroundColor
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 32).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: vinylImage.trailingAnchor, constant: 8).isActive = true
    }
    
    private func setArtistLabel() {
        artistLabel = UILabel()
        artistLabel.font = .Jura(ofSize: 14, weight: "Medium")
        artistLabel.textColor = .myBackgroundColor
        addSubview(artistLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: vinylImage.trailingAnchor, constant: 8).isActive = true
    }
    
    private func setPriceLabel() {
        priceLabel = UILabel()
        priceLabel.font = .Jura(ofSize: 18, weight: "Medium")
        priceLabel.textColor = .myBackgroundColor
        priceLabel.layer.borderColor = UIColor.myBackgroundColor.cgColor
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.cornerRadius = 5
        addSubview(priceLabel)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48).isActive = true
    }
    
    func animateVinyl() {
        vinylImageCenterX.constant = 0
        coverImagerCenterX.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.vinylImageCenterX.constant = 8
            self.coverImagerCenterX.constant = -32
        }
    }
}
