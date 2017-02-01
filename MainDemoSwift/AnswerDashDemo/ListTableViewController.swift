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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = Utils.navbarRotate()
        
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
        self.navigationItem.titleView = Utils.navbarRotate()
    }
}
