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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewControlledTaskDelegate {
    
    let tableView = UITableView()
    private let cellId = "CellId"
    
    let viewModel = ViewModelVC()
    let evc = EditViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        settingsTableView()
        receiveInfoFromClosure()
        
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
    
    func receiveInfoFromClosure() {
        evc.sendTextClosure = { userText, pswText in
            self.viewModel.profile?.userText = userText
            self.viewModel.profile?.passwordText = pswText
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        
        if indexPath.row == 0 {
            cell.inputs(name: "UserName", textInput: viewModel.profile!.userText)
        } else {
            cell.inputs(name: "Password", textInput: viewModel.profile!.passwordText)
        }
        return cell
    }
    
    @objc func loginButtonAction() {
        evc.delegate = self
        present(evc, animated: true, completion: nil)
        // variant with navigationController
//        navigationController?.pushViewController(evc, animated: true)
    }
    
    func sendTask(userName: String, password: String) {
        viewModel.profile?.userText = userName
        viewModel.profile?.passwordText = password
        tableView.reloadData()
    }
}

