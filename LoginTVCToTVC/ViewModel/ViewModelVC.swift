//
//  ViewModelVC.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import Foundation


class ViewModelVC {
    
//    var profile = Profile(userText: "Please go in edit", passwordText: "please enter your psw in edit")
    
    var isTextExist: Bool {
        if profile!.userText.count > 3, (profile?.passwordText.count)! > 3 {
            return true
        } else {
            return false
        }
    }
    
    var profile: Profile?
    init() {
        profile = Profile(userText: "", passwordText: "")
    }
    
//    func startCheck() {
//        if profile!.userText.count < 0 {
//            isTextExist = false
//        } else {
//            isTextExist = true
//        }
//        print(isTextExist)
//    }
}
