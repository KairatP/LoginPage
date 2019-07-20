//
//  ViewController.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

protocol ViewControlledTaskDelegate {
    func sendTask(userName: String, password: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    private let cellId = "CellId"
    
    var delegate: ViewControlledTaskDelegate?
    let viewModel = ViewModelVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        settingsTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(loginButtonAction))
    }
    
    func settingsTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.isScrollEnabled = false
        
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 25, y: 250, width: 350, height: 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if viewModel.isTextExist == false {
//            return 0
//        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        if indexPath.row == 0 {
            cell.userLabel.text = "\(viewModel.profile!.userText)"
            cell.label.text = "User name:"
        } else {
            cell.userLabel.text = "\(viewModel.profile!.passwordText)"
            cell.label.text = "Password"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func loginButtonAction() {
        
        self.navigationController?.pushViewController(EditViewController(), animated: true)
    }
}

