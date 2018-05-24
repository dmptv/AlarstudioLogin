//
//  LoginControllerViewModel.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation

class LoginControllerViewModel: NSObject {
    enum State {
        case notSearchedYet
        case loading
        case noResults
        case results
    }
    
    var state: State = .notSearchedYet
    
    // data model
    private var user: AppUser?
    
    public func setUser(_ user: AppUser? ) {
        self.user = user
    }
    
    
    
    func loginUser(username: String?, password: String?, completion: @escaping CompletionHandler) {
        
        state = .loading
        
        ApiClient.shared.authUser(username: username, password: password) { result in
            
            switch result {
            case .sucsess:
                printMine("success")
                 self.state = .results
                completion(.sucsess)
                break
            case .failure:
                printMine("failure")
                self.state = .noResults
                completion(.failure)
                break
            }
            
        }
    }

  
}















