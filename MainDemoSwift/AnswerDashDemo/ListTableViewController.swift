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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.addAnswerDashButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AnswerDash.appState = "testappstate"
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
