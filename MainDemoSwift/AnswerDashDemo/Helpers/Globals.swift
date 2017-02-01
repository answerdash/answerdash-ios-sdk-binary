//
//  Globals.swift
//  AnswerDashDemo
//
//  Created by Harry Soehalim on 1/27/17.
//  Copyright © 2017 AnswerDash. All rights reserved.
//

import UIKit

internal class Constants {
    
    static let navbarHeight: CGFloat = 44
    
}

internal class Utils {
    
    static func navbarRotate () -> UIImageView {
        let titleView = UIImageView()
        titleView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: Constants.navbarHeight)
        titleView.contentMode = .center
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            titleView.image = UIImage(named: "navbar-landscape")
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            titleView.image = UIImage(named: "navbar-portrait")
        }

        return titleView
    }

}
