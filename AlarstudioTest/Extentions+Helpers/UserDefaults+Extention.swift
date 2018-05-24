//
//  UserDefaults + helpers.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value , forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
