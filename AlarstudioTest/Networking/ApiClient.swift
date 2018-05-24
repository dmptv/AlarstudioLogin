//
//  ApiClient.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

enum Result {
    case sucsess
    case failure
}

typealias CompletionHandler = (Result) -> Void

class ApiClient {
    
    enum Codes: String {
        case OK = "ok"
        case Status = "status"
        case Code = "code"
    }
    
    static let shared = ApiClient()
    private init(){}
    
    func authUser(username: String?, password: String?, completion: @escaping CompletionHandler) {
        
        guard let username = username, let password = password else {
            printMine("--- username password nil")
            return
        }
        
        Alamofire.request(NetworkRouter.loginUser(username, password))
            .responseJSON { response in
               
                guard response.result.isSuccess, let value = response.result.value else {
                        printMine("Error while fetching user\(String(describing: response.result.error))")
                        completion(.failure)
                        return
                }
                
                if JSON(value)[Codes.Status.rawValue].stringValue != Codes.OK.rawValue {
                    completion(.failure)
                    return
                } else if JSON(value)[Codes.Status.rawValue].stringValue == Codes.OK.rawValue  {
                    let code = JSON(value)[Codes.Code.rawValue].intValue
                    UserDefaults.standard.setValidationCode(value: code)
                    completion(.sucsess)
                }
        }
        
        /*
         {
         "status": "ok",
         "code": "5669137482"
         }
         */
    }
}









