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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AnswerDash.appState = ""
    }
}
