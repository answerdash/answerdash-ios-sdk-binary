//
//  HomeViewController.swift
//  AnswerDashDemo
//
//  Created by Channa K'thilake on 6/20/16.
//  Copyright © 2016 AnswerDash. All rights reserved.
//

import UIKit
import AnswerDashSDK

class HomeViewController: UIViewController {
    
    var background = UIImageView()
    var titleView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.view.frame.size.width,
                                 height: Constants.navbarHeight)
        titleView.image = UIImage(named: "navbar-portrait")
        titleView.contentMode = UIViewContentMode.center
        self.navigationItem.titleView = titleView
        
        background.frame = CGRect(x: 0,
                                  y: Constants.navbarHeight,
                                  width: self.view.frame.size.width,
                                  height: self.view.frame.size.height)
        background.image = UIImage(named: "home-background-portrait")
        background.contentMode = UIViewContentMode.scaleAspectFill
        background.clipsToBounds = true
        self.view.addSubview(background)
        self.view.sendSubview(toBack: background)
        
        // get notification while rotating
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(HomeViewController.rotate),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AnswerDash.appState = ""
    }
    
    func rotate() {
        titleView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.view.frame.size.width,
                                 height: Constants.navbarHeight)
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            titleView.image = UIImage(named: "navbar-landscape")
            self.navigationItem.titleView = titleView
            
            background.frame = self.view.frame
            background.image = UIImage(named: "home-background-landscape")
            self.view.sendSubview(toBack: background)
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            titleView.image = UIImage(named: "navbar-portrait")
            self.navigationItem.titleView = titleView
            
            background.frame = CGRect(x: 0,
                                      y: Constants.navbarHeight,
                                      width: self.view.frame.size.width,
                                      height: self.view.frame.size.height)
            background.image = UIImage(named: "home-background-portrait")
            self.view.sendSubview(toBack: background)
        }
    }
}
