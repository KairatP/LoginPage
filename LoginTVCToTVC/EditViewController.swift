//
//  EditViewController.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel = ViewModelEVC()
    let buttonBack = UIButton()
    var sendTextClosure: ((String, String) -> Void)?
    
    var delegate: ViewControlledTaskDelegate?
    
    let tableView = UITableView()
    private let cellID = "cellIDE"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(buttonBack)
        
        settingsTableView()
        buttonBack.frame = CGRect(x: view.frame.width / 2 - 50, y: 385, width: 100, height: 20)
        buttonBack.setTitle("Save", for: .normal)
        buttonBack.setTitleColor(.blue, for: .normal)
        // used for navigationController variant
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonAction))
        
        buttonBack.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
    func settingsTableView() {
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 25, y: 250, width: 350, height: 100)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(EditTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? EditTableViewCell
        cell?.delagate = self
        
        if indexPath.row == 0 {
            cell!.inputs(name: "User name:", textInput: "")
        } else {
            cell!.inputs(name: "Password:", textInput: "")
        }
        return cell!
    }
    
    @objc func saveButtonAction() {
        // MARK: - Closure
//        sendTextClosure?(viewModel.profile!.userText, viewModel.profile!.passwordText)
        
        // MARK: - Delegate
        delegate?.sendTask(userName: viewModel.profile!.userText, password: viewModel.profile!.passwordText)
        dismiss(animated: true, completion: nil)
    }
}

extension EditViewController: TextViewCellDelagate {
    func textFrom(text: String, cell: EditTableViewCell) {
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        if indexPath.row == 0 {
            viewModel.profile?.userText = text
            viewModel.observer = text.count
            cell.userTextField.textColor = viewModel.isValid ? #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) : .black
        } else {
            viewModel.profile?.passwordText = text
            viewModel.observer = text.count
            cell.userTextField.textColor = viewModel.isValid ? #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) : .black
        }
    }
}

