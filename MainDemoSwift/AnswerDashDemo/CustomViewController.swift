//
//  CustomViewController.swift
//  AnswerDashDemo
//
//  Created by Thomas Brandstatter on 05/07/16.
//  Copyright © 2016 AnswerDash. All rights reserved.
//

import UIKit
import AnswerDashSDK

class CustomViewController: UIViewController {

    var titleView = UIImageView()
    
    // MARK: - Outlets

    @IBOutlet weak var customButton: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        styleButton()
        
        titleView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
        titleView.image = UIImage(named: "navbar-portrait")
        titleView.contentMode = UIViewContentMode.center
        self.navigationItem.titleView = titleView

        // get notification while rotating
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(CustomViewController.rotate),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        AnswerDash.appState = "testappstate"
    }

    // MARK: - Style

    fileprivate func styleButton() {
        customButton.layer.cornerRadius = customButton.frame.height / 2
        customButton.layer.borderWidth = 1
        customButton.layer.borderColor = customButton.tintColor.cgColor
    }

    // MARK: - Actions

    @IBAction func didTapCustomButton(_ sender: AnyObject) {

        AnswerDash.show()
    }
    
    func rotate() {
        titleView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
            titleView.image = UIImage(named: "navbar-landscape")
            self.navigationItem.titleView = titleView
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            titleView.image = UIImage(named: "navbar-portrait")
            self.navigationItem.titleView = titleView
        }
    }
}
