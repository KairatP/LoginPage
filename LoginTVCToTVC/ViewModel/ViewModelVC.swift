//
//  ViewModelVC.swift
//  LoginTVCToTVC
//
//  Created by Kairat on 7/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import Foundation

class ViewModelVC {
    var profile: Profile?
    init() {
        profile = Profile(userText: "", passwordText: "")
    }
}
