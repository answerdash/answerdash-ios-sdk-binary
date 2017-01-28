//
//  UINavigationBar+.swift
//  AnswerDashDemo
//
//  Created by Harry Soehalim on 1/18/17.
//  Copyright © 2017 AnswerDash. All rights reserved.
//

import UIKit

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        let width = UIScreen.main.bounds.width
        let newSize = CGSize(width: width,
                             height: Constants.navbarHeight)
        return newSize
    }
}
