//
//  AlertManager.swift
//  ShoppingApp
//
//  Created by Telem Tobi on 26/04/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import Foundation
import SwiftEntryKit

class AlertManager {
    
    var bottomToastAttributes: EKAttributes!
    
    static let shared = AlertManager()
    private init(){
        setNotificationViews()
    }
    
    private func setNotificationViews() {
        bottomToastAttributes = EKAttributes.bottomFloat
        bottomToastAttributes.entryBackground = .color(color: .myBackgroundColor)
        bottomToastAttributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        bottomToastAttributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
        bottomToastAttributes.statusBar = .light
        bottomToastAttributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        bottomToastAttributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .intrinsic)
    }
}
