//
//  BrowseController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 12/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class BrowseController: TabController {
    
    var searchBar: UISearchBar!
    var searchTableView: SearchTableView!
    var browseCollectionView: BrowseCollectionView!
    
    var searchMode = false {
        didSet {
            browseCollectionView.view.isHidden = searchMode
            searchTableView.view.isHidden = !searchMode
            searchBar.setShowsCancelButton(searchMode, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchBar()
        setSearchTableView()
        setBrowseCollectionView()
    }
    
    func setSearchBar() {
        searchBar = UISearchBar()
        searchBar.tintColor = .primaryColor
        searchBar.barTintColor = .myBackgroundColor
        searchBar.placeholder = "Look for an Album or an Artist"
        searchBar.delegate = self
        searchBar.setTextAttributes()
        view.addSubview(searchBar)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setBrowseCollectionView() {
        let layout = LayoutsManager.shared.browseLayout()
        browseCollectionView = BrowseCollectionView(collectionViewLayout: layout)
        browseCollectionView.delegate = self
        
        addChild(browseCollectionView)
        browseCollectionView.didMove(toParent: self)
        view.addSubview(browseCollectionView.view)
        
        browseCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        browseCollectionView.view.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        browseCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        browseCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        browseCollectionView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func setSearchTableView() {
        searchTableView = SearchTableView()
        searchTableView.view.isHidden = true
        searchTableView.delegate = self
        
        addChild(searchTableView)
        searchTableView.didMove(toParent: self)
        view.addSubview(searchTableView.view)
        
        searchTableView.view.translatesAutoresizingMaskIntoConstraints = false
        searchTableView.view.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        searchTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchTableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension BrowseController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchMode = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            searchMode = false
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var results: [[String]] = Array(repeating: [], count: 2)
        demoAlbums.forEach {
            if $0.value.title.contains(searchText) {
                results[0].append($0.key)
            }
        }
        demoArtists.forEach {
           if $0.value.name.contains(searchText) {
               results[1].append($0.key)
           }
        }
        searchTableView.searchResults = results
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchMode = false
        view.endEditing(true)
    }
}
