//
//  ListTableViewController.swift
//  AnswerDashDemo
//
//  Created by Channa K'thilake on 6/21/16.
//  Copyright © 2016 AnswerDash. All rights reserved.
//

import UIKit
import AnswerDashSDK

class ListTableViewController: UITableViewController {

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
        
        tableView.addAnswerDashButton()
        
        // get notification while rotating
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ListTableViewController.rotate),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AnswerDash.appState = "testappstate"
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func rotate() {
        titleView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.view.frame.size.width,
                                 height: Constants.navbarHeight)
        
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
