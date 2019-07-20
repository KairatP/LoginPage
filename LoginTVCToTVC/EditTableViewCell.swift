//
//  EditTableViewCell.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

protocol TextViewCellDelagate {
    func textFrom(text: String)
}

class EditTableViewCell: UITableViewCell {
    
    var delagate: TextViewCellDelagate?
    
    let label = UILabel()
    var userTextField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellSetup()
        
        userTextField.addTarget(self, action: #selector(sendMessage), for: .allEditingEvents)
    }
    
    func cellSetup() {
        
        addSubview(label)
        addSubview(userTextField)
        
        label.frame = CGRect(x: 30, y: 5, width: 90, height: 30)
        userTextField.frame = CGRect(x: 124, y: 5, width: 200, height: 30)
        
        userTextField.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.9294117647, blue: 0.2980392157, alpha: 0.6737746147)
        userTextField.layer.cornerRadius = 4
        userTextField.clipsToBounds = true
    }
    
    @objc func sendMessage(textField: UITextField) {
        delagate?.textFrom(text: textField.text!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
