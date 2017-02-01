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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = Utils.navbarRotate()
        
        background.frame = CGRect(x: 0,
                                  y: Constants.navbarHeight,
                                  width: self.view.frame.size.width,
                                  height: Constants.navbarHeight)
        background.image = UIImage(named: "home-background-portrait")
        background.contentMode = .scaleAspectFill
        background.center = self.view.center
        self.view.insertSubview(background, at: 0)
        
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
        self.navigationItem.titleView = Utils.navbarRotate()
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            background.frame = self.view.frame
            background.image = UIImage(named: "home-background-landscape")
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            background.frame = CGRect(x: 0,
                                      y: Constants.navbarHeight,
                                      width: self.view.frame.size.width,
                                      height: Constants.navbarHeight)
            background.image = UIImage(named: "home-background-portrait")
        }
        
        background.center = self.view.center
        background.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
