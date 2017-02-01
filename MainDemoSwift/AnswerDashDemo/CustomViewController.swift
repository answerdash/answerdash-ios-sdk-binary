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

    // MARK: - Outlets

    @IBOutlet weak var customButton: UIButton!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        styleButton()
        
        self.navigationItem.titleView = Utils.navbarRotate()

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
        self.navigationItem.titleView = Utils.navbarRotate()
    }
}
