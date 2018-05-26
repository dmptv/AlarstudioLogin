//
//  LoginControllerViewModel.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation

class LoginControllerViewModel: NSObject, NetworkLayerProtocol {
    typealias StateEnum = State
    typealias ResultType = Result
    
    var state: State = .notSearchedYet
    
     func loginUserSesion(username: String?, password: String?, completion: @escaping CompletionHandler) {
        
        state = .loading
        
        ApiClient.shared.authUserSession(username: username, password: password, completion: { result in
            
            switch result {
            case .sucsess:
                printMine("success")
                UserDefaults.standard.setIsLoggedIn(value: true)
                self.state = .results
                completion(.sucsess(nil))
                break
            case .failure:
                printMine("failure")
                self.state = .noResults
                UserDefaults.standard.setIsLoggedIn(value: false)
                completion(.failure)
                break
            }

        })
        
    }

    deinit {
        printMine("deinit: \(self)")
    }
  
}
























