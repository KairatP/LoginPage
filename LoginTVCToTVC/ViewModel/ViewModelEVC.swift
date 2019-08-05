//
//  ViewModelEVC.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/21/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import Foundation

class ViewModelEVC {
    
    var profile: Profile?
    init() {
        profile = Profile(userText: "", passwordText: "")
    }
    
    var isValid: Bool = false 
    
    var observer: Int = 0 {
        didSet {
            if observer > 3 {
                isValid = true
                return
            }
           isValid = false
        }
    }
}


