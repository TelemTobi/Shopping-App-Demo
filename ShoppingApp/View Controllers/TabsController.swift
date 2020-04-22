//
//  TabsController.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 05/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import Foundation
import UIKit

class TabsController: UIViewController {

    var viewPager: WormTabStrip!
    var titleLabel: UILabel!
    var userButton: UIButton!
    var menuButton: UIButton!
    
    var browseController: BrowseController!
    var shopController: ShopController!
    var cartController: CartController!
    var tabControllers: [AlbumDelegate]!
    var albumController: AlbumController!
    var selectedTab = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        setSubControllers()
        setUpTitle()
        setUpButtons()
        setUpViewPager()
    }
    
    func setUpElements() {
        dismissKeyboardWhenTapped()
        view.backgroundColor = .primaryColor
    }
    
    func setSubControllers() {
        browseController = BrowseController()
        addChild(browseController)
        browseController.didMove(toParent: self)
        
        shopController = ShopController()
        addChild(shopController)
        shopController.didMove(toParent: self)
        
        cartController = CartController()
        addChild(cartController)
        cartController.didMove(toParent: self)
        
        tabControllers = [shopController, browseController, cartController]
    }
    
    func setUpViewPager() {
        viewPager = WormTabStrip(width: view.frame.width, height: view.frame.height * 0.88)
        self.view.addSubview(viewPager)
        
        viewPager.translatesAutoresizingMaskIntoConstraints = false
        viewPager.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        viewPager.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewPager.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewPager.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        viewPager.delegate = self
        viewPager.eyStyle.wormStyel = .BUBBLE
        viewPager.eyStyle.isWormEnable = true
        viewPager.eyStyle.spacingBetweenTabs = 0
        viewPager.eyStyle.dividerBackgroundColor = .primaryColor
        viewPager.eyStyle.tabItemSelectedColor = .white
        viewPager.currentTabIndex = 1
        viewPager.buildUI()
    }
    
    func setUpAlbumController() {
        
    }
    
    func setUpTitle() {
        titleLabel = UILabel()
        titleLabel.text = "Tobi"
        titleLabel.textColor = .white
        titleLabel.font = .MandatoryPlaything(ofSize: 36)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 4).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setUpButtons() {
        userButton = UIButton(type: .custom)
        userButton.tintColor = .secondaryColor
        userButton.setImage(UIImage(systemName: "person.circle"), for: .normal)
        userButton.setImage(UIImage(systemName: "person.circle.fill"), for: .highlighted)
        userButton.contentVerticalAlignment = .fill
        userButton.contentHorizontalAlignment = .fill
        view.addSubview(userButton)
        view.bringSubviewToFront(userButton)
        
        userButton.translatesAutoresizingMaskIntoConstraints = false
        userButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        userButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        userButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        menuButton = UIButton(type: .custom)
        menuButton.tintColor = .secondaryColor
        menuButton.setImage(UIImage(systemName: "line.horizontal.3.decrease"), for: .normal)
        menuButton.contentVerticalAlignment = .fill
        menuButton.contentHorizontalAlignment = .fill
        view.addSubview(menuButton)
        view.bringSubviewToFront(menuButton)
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: -2).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
}

extension TabsController: WormTabStripDelegate {
    
    func tabSelected(index: Int) {
        if index == selectedTab {
            tabControllers[index].backButtonTapped()
            return
        }
        selectedTab = index
        if index == 2 {
            cartController.reloadData()
        }
    }
    
    func WTSNumberOfTabs() -> Int {
        3
    }
    
    func WTSViewOfTab(index: Int) -> UIView {
        switch index {
        case 0:
            return shopController.view
        case 1:
            return browseController.view
        default:
            return cartController.view
        }
    }
    
    func WTSTitleForTab(index: Int) -> String {
        TabItems.titles[index]
    }
    
    func imageForTab(index: Int) -> UIImage {
        TabItems.images[index]!
    }
    
    func WTSReachedLeftEdge(panParam: UIPanGestureRecognizer) {
        
    }
    
    func WTSReachedRightEdge(panParam: UIPanGestureRecognizer) {
        
    }
}
