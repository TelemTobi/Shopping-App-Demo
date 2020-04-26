//
//  SearchController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 26/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class SearchController: UISearchController {
    
    var searchTableView: SearchTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
    }
    
    func setupElements() {
        searchBar.tintColor = .primaryColor
        searchBar.barTintColor = .myBackgroundColor
        searchBar.placeholder = "Look for an Album or an Artist"
        searchBar.setTextAttributes()
    }
}
