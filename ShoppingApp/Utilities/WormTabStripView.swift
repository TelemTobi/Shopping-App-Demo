//
//  TestTabButton.swift
//  EYViewPager
//
//  Created by Ezimet Yusuf on 10/16/16.
//  Copyright © 2016 ww.otkur.biz. All rights reserved.
//

import Foundation
import UIKit

//class WormTabStripButton: UILabel{
//
//
//    var index:Int?
//    var paddingToEachSide:CGFloat = 10
//    var tabText:NSString?{
//        didSet{
//            let textSize:CGSize = tabText!.size(withAttributes: [NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 24)])
//            self.frame.size.width = textSize.width + paddingToEachSide + paddingToEachSide
//
//            self.text = String(tabText!)
//        }
//    }
//    //MARK: init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
//    convenience required init(key:String) {
//        self.init(frame:CGRect.zero)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//
//    }
//}

class WormTabStripView: UIView {
    
    var index:Int?
    var paddingToEachSide:CGFloat = 10
    
    var label: UILabel!
    var imageView: UIImageView!
    
    var tabText:NSString?{
        didSet{
//            let textSize:CGSize = tabText!.size(withAttributes: [NSAttributedString.Key.font: label.font!])
//            self.frame.size.width = textSize.width + paddingToEachSide + paddingToEachSide + imageView.frame.width
            self.label.text = String(tabText!)
        }
    }
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpElements()
        
    }
    convenience required init(key:String) {
        self.init(frame:CGRect.zero)

        setUpElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
        label = UILabel()
        label.font = .Jura(ofSize: 18, weight: "Medium")
        label.textAlignment = .left
        
        imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
