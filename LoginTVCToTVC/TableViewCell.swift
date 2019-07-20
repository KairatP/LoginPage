//
//  TableViewCell.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let label = UILabel()
    var userLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellSetup()
    }
    
    func cellSetup() {
        
        addSubview(label)
        addSubview(userLabel)
        
        label.frame = CGRect(x: 30, y: 5, width: 90, height: 30)
        userLabel.frame = CGRect(x: 124, y: 5, width: 200, height: 30)
        
        userLabel.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.9294117647, blue: 0.2980392157, alpha: 0.6737746147)
        userLabel.layer.cornerRadius = 4
        userLabel.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
