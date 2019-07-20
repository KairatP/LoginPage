//
//  EditViewController.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel = ViewModelVC()
    
    let tableView = UITableView()
    private let cellID = "cellIDE"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        settingsTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonAction))
    }
    
    func settingsTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(EditTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.isScrollEnabled = false
        
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 25, y: 250, width: 350, height: 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? EditTableViewCell
        cell?.delagate = self
        
        if indexPath.row == 0 {
            cell!.userTextField.text = "\(viewModel.profile!.userText)"
            cell!.label.text = "User name:"
        } else {
            cell!.userTextField.text = "\(viewModel.profile!.passwordText)"
            cell!.label.text = "Password"
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc func saveButtonAction() {
        
//        let indexPath = tableView(tableView(<#T##tableView: UITableView##UITableView#>, numberOfRowsInSection: <#T##Int#>)
//
////        let indexPath = tableView.indexPath(for: EditTableViewCell())
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath!) as? EditTableViewCell
//
//        if indexPath?.row == 0 {
//            viewModel.profile?.userText = (cell?.userTextField.text)!
//        } else {
//            viewModel.profile?.passwordText = (cell?.userTextField.text!)!
        }
    
    func indexPath(for cell: EditTableViewCell) -> IndexPath? {
        
    }
    }
    
    extension EditViewController: TextViewCellDelagate {
        func textFrom(text: String) {
            print(text)
            
            indexPath(for: EditTableViewCell)
            
            tableView.cell
            
        }
}

