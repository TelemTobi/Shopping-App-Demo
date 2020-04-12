//
//  SearchTableView.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 12/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SearchTableView: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .myBackgroundColor
        tableView.separatorStyle = .none
        
        tableView.register(AlbumTableCell.self, forCellReuseIdentifier: AlbumTableCell.id)
        tableView.register(ArtistTableCell.self, forCellReuseIdentifier: ArtistTableCell.id)
        tableView.register(SearchSectionHeader.self, forHeaderFooterViewReuseIdentifier: SearchSectionHeader.id)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableCell.id) as! AlbumTableCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableCell.id) as! ArtistTableCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("item selected")
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
        50
    }
}
