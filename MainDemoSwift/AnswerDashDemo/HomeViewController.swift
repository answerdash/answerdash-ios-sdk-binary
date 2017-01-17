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
        
        background.frame = self.view.frame
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
        background.frame = self.view.frame
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            background.image = UIImage(named: "home-background-landscape")
            self.view.sendSubview(toBack: background)
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            background.image = UIImage(named: "home-background-portrait")
            self.view.sendSubview(toBack: background)
        }
    }
}
