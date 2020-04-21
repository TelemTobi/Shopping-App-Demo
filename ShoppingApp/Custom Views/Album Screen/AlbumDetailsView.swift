//
//  AlbumDetailsView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 15/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class AlbumDetailsView: UIView {
    
    private var tracksLabel: UILabel!
    private var genreLabel: UILabel!
    private var genreImage: UIImageView!
    private var dateLabel: UILabel!
    private var notesLabel: UILabel!
    
    private var tracksStackView: UIStackView!
    private var genreStackView: UIStackView!
    
    var album: Album? {
        didSet {
            tracksLabel.text = (album?.tracks.count ?? 0 < 10) ? "0\(album?.tracks.count.description ?? "")" : album?.tracks.count.description
            notesLabel.text = album?.notes
            genreLabel.text = musicGenres[album?.genre ?? 0].0
            genreImage.image = musicGenres[album?.genre ?? 0].1
            dateLabel.text = album?.releaseDate
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        setTracksLabel()
        setGenreLabel()
        setDateLabel()
        setNotesLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func titleLabel(_ title: String) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.textColor = .lightGray
        titleLabel.font = .Jura(ofSize: 12, weight: "Bold")
        titleLabel.text = title
        return titleLabel
    }
    
    private func setTracksLabel() {
        tracksLabel = UILabel()
        tracksLabel.textColor = .primaryColor
        tracksLabel.font = .Jura(ofSize: 24, weight: "Medium")
        
        tracksStackView = UIStackView(arrangedSubviews: [tracksLabel, titleLabel("Tracks")])
        tracksStackView.axis = .vertical
        tracksStackView.spacing = 12
        addSubview(tracksStackView)
        
        tracksStackView.translatesAutoresizingMaskIntoConstraints = false
        tracksStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        tracksStackView.bottomAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
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
        
        genreStackView = UIStackView(arrangedSubviews: [stackView, titleLabel("Genre")])
        genreStackView.axis = .vertical
        genreStackView.spacing = 12
        addSubview(genreStackView)
        
        genreStackView.translatesAutoresizingMaskIntoConstraints = false
        genreStackView.bottomAnchor.constraint(equalTo: tracksStackView.bottomAnchor).isActive = true
        genreStackView.leadingAnchor.constraint(equalTo: tracksLabel.leadingAnchor, constant: 80).isActive = true
    }
    

    
    private func setDateLabel() {
        dateLabel = UILabel()
        dateLabel.textAlignment = .right
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textColor = .primaryColor
        dateLabel.font = .Jura(ofSize: 18, weight: "Bold")
        
        let dateStackView = UIStackView(arrangedSubviews: [dateLabel, titleLabel("Release Date")])
        dateStackView.axis = .vertical
        dateStackView.spacing = 12
        addSubview(dateStackView)
        
        dateStackView.translatesAutoresizingMaskIntoConstraints = false
        dateStackView.bottomAnchor.constraint(equalTo: tracksStackView.bottomAnchor).isActive = true
        dateStackView.leadingAnchor.constraint(greaterThanOrEqualTo: genreStackView.trailingAnchor, constant: 8).isActive = true
        dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    private func setNotesLabel() {
        notesLabel = UILabel()
        notesLabel.backgroundColor = .myBackgroundColor
        notesLabel.textColor = .primaryColor
        notesLabel.numberOfLines = 0
        notesLabel.font = .Jura(ofSize: 14, weight: "Medium")
        addSubview(notesLabel)
        
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        notesLabel.topAnchor.constraint(equalTo: tracksStackView.bottomAnchor, constant: 24).isActive = true
        notesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        notesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        notesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
}
