//
//  AlbumDetailsView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 15/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumDetailsView: UIView {
    
    private var containerStackView: UIStackView!
    private var tracksLabel: UILabel!
    private var genreLabel: UILabel!
    private var genreImage: UIImageView!
    private var dateLabel: UILabel!
    private var artistImage: UIImageView!
    private var artistButton: UIButton!
    
    var album: Album? {
        didSet {
            tracksLabel.text = (album?.tracks.count ?? 0 < 10) ? "0\(album?.tracks.count.description ?? "")" : album?.tracks.count.description
            genreLabel.text = musicGenres[album?.genre ?? 0].0
            genreImage.image = musicGenres[album?.genre ?? 0].1
            dateLabel.text = album?.releaseDate
            
            artistImage.image = album?.artist.image
            artistButton.setTitle("More by \(album?.artist.name ?? "")", for: .normal)
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setStackView()
        setTracksLabel()
        setGenreLabel()
        setDateLabel()
        setArtistImage()
        setArtistButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackView() {
        containerStackView = UIStackView()
        containerStackView.axis = .horizontal
        containerStackView.distribution = .fill
        containerStackView.alignment = .bottom
        containerStackView.spacing = 32
        addSubview(containerStackView)
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
//        containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    private func titleLabel(_ title: String) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.textColor = .lightGray
        titleLabel.font = .Jura(ofSize: 12, weight: "Bold")
        titleLabel.text = title
        return titleLabel
    }
    
    private func setGenreLabel() {
        genreLabel = UILabel()
        genreLabel.textColor = .primaryColor
        genreLabel.font = .Jura(ofSize: 20, weight: "Bold")
        
        genreImage = UIImageView()
        genreImage.contentMode = .scaleAspectFit
        genreImage.translatesAutoresizingMaskIntoConstraints = false
        genreImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        genreImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [genreLabel, genreImage])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 12
        
        let tracksStackView = UIStackView(arrangedSubviews: [stackView, titleLabel("Genre")])
        tracksStackView.axis = .vertical
        tracksStackView.spacing = 12
        containerStackView.addArrangedSubview(tracksStackView)
    }
    
    private func setTracksLabel() {
        tracksLabel = UILabel()
        tracksLabel.textColor = .primaryColor
        tracksLabel.font = .Jura(ofSize: 24, weight: "Medium")
        
        let tracksStackView = UIStackView(arrangedSubviews: [tracksLabel, titleLabel("Tracks")])
        tracksStackView.axis = .vertical
        tracksStackView.spacing = 12
        containerStackView.addArrangedSubview(tracksStackView)
    }
    
    private func setDateLabel() {
        dateLabel = UILabel()
        dateLabel.textColor = .primaryColor
        dateLabel.font = .Jura(ofSize: 18, weight: "Bold")
        
        let dateStackView = UIStackView(arrangedSubviews: [dateLabel, titleLabel("Release Date")])
        dateStackView.axis = .vertical
        dateStackView.spacing = 12
        containerStackView.addArrangedSubview(dateStackView)
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
        artistImage.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: 24).isActive = true
        artistImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        artistImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        artistImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setArtistButton() {
        artistButton = UIButton()
        artistButton.backgroundColor = .none
        artistButton.setTitleColor(.primaryColor, for: .normal)
        artistButton.titleLabel?.font = .Jura(ofSize: 20, weight: "Medium")
        addSubview(artistButton)
        
        artistButton.translatesAutoresizingMaskIntoConstraints = false
        artistButton.centerYAnchor.constraint(equalTo: artistImage.centerYAnchor, constant: 4).isActive = true
        artistButton.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 20).isActive = true
    }
}
