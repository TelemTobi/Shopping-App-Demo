//
//  SearchTableView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 12/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SearchTableView: UITableViewController {
    
    var delegate: AlbumDelegate?
    var searchResults: [[String]] = Array(repeating: [], count: 2) {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .myBackgroundColor
        tableView.separatorStyle = .none
        
        tableView.register(AlbumSearchCell.self, forCellReuseIdentifier: AlbumSearchCell.id)
        tableView.register(ArtistSearchCell.self, forCellReuseIdentifier: ArtistSearchCell.id)
        tableView.register(SearchSectionHeader.self, forHeaderFooterViewReuseIdentifier: SearchSectionHeader.id)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: AlbumSearchCell.id) as! AlbumSearchCell
            let albumId = searchResults[indexPath.section][indexPath.row]
            cell.album = demoAlbums[albumId]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArtistSearchCell.id) as! ArtistSearchCell
            let artistId = searchResults[indexPath.section][indexPath.row]
            cell.artist = demoArtists[artistId]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AlbumSearchCell {
            delegate?.didSelectAlbum(cell.album)
        } else if let cell = tableView.cellForRow(at: indexPath) as? ArtistSearchCell {
            delegate?.didSelectArtist(cell.artist)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SearchSectionHeader.id) as! SearchSectionHeader
        header.title = section == 0 ? "Albums" : "Artists"
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        (searchResults[section].count > 0) ? 50 : 0
    }
}
