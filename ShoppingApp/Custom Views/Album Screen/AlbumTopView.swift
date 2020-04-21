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
    private var coverImagerCenterY: NSLayoutConstraint!
    private var coverImageWidth: NSLayoutConstraint!
    private var coverImageHeight: NSLayoutConstraint!
    
    private var vinylImageCenterX: NSLayoutConstraint!
    private var titleTopAnchor: NSLayoutConstraint!
    private var titleLeadingAnchor: NSLayoutConstraint!
    private var titleTrailingAnchor: NSLayoutConstraint!
    
    var album: Album? {
        didSet {
            backgroundImage.image = album?.image
            coverImage.image = album?.image
            titleLabel.text = album?.title
            artistLabel.text = demoArtists[album?.artist ?? ""]?.name
            priceLabel.text = " \(album?.price.description ?? "15.0")$ "
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setBackgroundImage()
        setCoverImage()
        setVinylImage()
        setPriceLabel()
        setTitleLabel()
        setArtistLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackgroundImage() {
        backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleToFill
        addSubview(backgroundImage)
        self.constraintToBounds(backgroundImage)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        addSubview(blurEffectView)
        self.constraintToBounds(blurEffectView)
    }
    
    private func setCoverImage() {
        coverImage = UIImageView()
        coverImage.contentMode = .scaleAspectFit
        addSubview(coverImage)
        
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImagerCenterY = coverImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -32)
        coverImagerCenterX = coverImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -32)
        coverImageWidth = coverImage.widthAnchor.constraint(equalToConstant: 140)
        coverImageHeight = coverImage.heightAnchor.constraint(equalToConstant: 140)
        NSLayoutConstraint.activate([coverImageHeight, coverImageWidth, coverImagerCenterX, coverImagerCenterY])
    }
    
    private func setVinylImage() {
        vinylImage = UIImageView(image: UIImage(named: "vinyl_record"))
        vinylImage.contentMode = .scaleAspectFit
        addSubview(vinylImage)
        
        vinylImage.translatesAutoresizingMaskIntoConstraints = false
        vinylImageCenterX = vinylImage.centerXAnchor.constraint(equalTo: coverImage.centerXAnchor, constant: 0)
        vinylImageCenterX.isActive = true
        vinylImage.centerYAnchor.constraint(equalTo: coverImage.centerYAnchor, constant: 4).isActive = true
        vinylImage.widthAnchor.constraint(equalTo: coverImage.widthAnchor, multiplier: 1.2).isActive = true
        vinylImage.heightAnchor.constraint(equalTo: coverImage.widthAnchor, multiplier: 1.2).isActive = true
        
        bringSubviewToFront(coverImage)
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
        priceLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    private func setTitleLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.font = .Jura(ofSize: 20, weight: "Bold")
        titleLabel.textColor = .myBackgroundColor
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTopAnchor = titleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 32)
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: coverImage.leadingAnchor, constant: -64)
        titleTrailingAnchor = titleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8)
        NSLayoutConstraint.activate([titleTopAnchor, titleLeadingAnchor, titleTrailingAnchor])
    }
    
    private func setArtistLabel() {
        artistLabel = UILabel()
        artistLabel.font = .Jura(ofSize: 14, weight: "Medium")
        artistLabel.textColor = .myBackgroundColor
        addSubview(artistLabel)
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        artistLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8).isActive = true
    }
    
    func animateVinyl() {
        vinylImageCenterX.constant = 0
        layoutIfNeeded()
        UIView.animate(withDuration: 1.0) {
            self.vinylImageCenterX.constant = 40
            self.layoutIfNeeded()
        }
    }
    
    func reset() {
        vinylImageCenterX.constant = 0
    }
    
    func shouldCollapse(_ shouldCollapse: Bool) {
        coverImagerCenterX.constant = shouldCollapse ? -92 : -32
        coverImagerCenterY.constant = shouldCollapse ? 0 : -32
        coverImageWidth.constant = shouldCollapse ? 75 : 140
        coverImageHeight.constant = shouldCollapse ? 75 : 140
        
        vinylImageCenterX.constant = shouldCollapse ? 0 : 40
        priceLabel.alpha = shouldCollapse ? 0 : 1
        
        titleTopAnchor.constant = shouldCollapse ? -64 : 32
        titleLeadingAnchor.constant = shouldCollapse ? 92 : -64
        titleTrailingAnchor.constant = shouldCollapse ? 64 : -8
    }
}
