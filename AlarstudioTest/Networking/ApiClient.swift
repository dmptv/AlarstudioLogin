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

class ApiClient: NetworkLayerProtocol {

    typealias ResultType = Result
    typealias StateEnum = State
    
    static let shared = ApiClient()
    private init(){}
    
    enum Codes: String {
        case OK = "ok"
        case Status = "status"
        case Code = "code"
    }
    
    fileprivate(set) var state: State = .notSearchedYet

    public func authUser(username: String?, password: String?, completion: @escaping CompletionHandler) {
        
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
                
                let status = JSON(value)[Codes.Status.rawValue].stringValue
                
                if status != Codes.OK.rawValue {
                    printMine("Wrong status: \(status)")
                    completion(.failure)
                    return
                } else if status == Codes.OK.rawValue  {
                    let code = JSON(value)[Codes.Code.rawValue].intValue
                    UserDefaults.standard.setValidationCode(value: code)
                    completion(.sucsess(nil))
                }
        }
    }
    
    func getList(code: Int?, page: Int?, completion: @escaping CompletionHandler) {
        guard let code = code, let page = page else {
            printMine("--- code page nil")
            return
        }
        
        printMine("page =", page)
        
        Alamofire.request(NetworkRouter.list(code, page))
        .responseJSON { response in
            
            guard response.result.isSuccess, let value = response.result.value else {
                printMine("Error while fetching list\(String(describing: response.result.error))")
                completion(.failure)
                return
            }
            
            let status = JSON(value)[Codes.Status.rawValue].stringValue
            
            if status != Codes.OK.rawValue {
                printMine("Wrong status: \(status)")
                completion(.failure)
                return
            } else if status == Codes.OK.rawValue  {
                completion(.sucsess(value))
            }
            
        }
    }
    
    /// url session
    //__________________________
    
    public func authUserSession(username: String?, password: String?, completion: @escaping CompletionHandler) {
        
        guard let username = username, let password = password else {
            printMine("--- username password nil")
            return
        }
        
        dataTask?.cancel()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        state = .loading
        
        let url = authUrlWithUsername(username, password: password)
        let session = URLSession.shared
        dataTask = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error as NSError?, error.code == -999 {
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data, let jsonDictionary = self.parse(json: jsonData) {
                
               
            }
            
        })
        dataTask?.resume()
        
    }
    
    fileprivate func parse(json data: Data) -> [String: Any]? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String : Any]
        } catch {
            print("JSON Error: \(error)")
            return nil
        }
    }
    
    fileprivate func authUrlWithUsername(_ username: String, password: String) -> URL {
        let urlString =
            String(format: "http://condor.alarstudios.com/test/auth.cgi?username=\(username)&password=\(password)")
        
        let url = URL(string: urlString)
        print("URL: \(url!)")
        return url!
    }
    
    
    fileprivate var dataTask: URLSessionDataTask? = nil
    
    public func getListSesion(code: Int?, page: Int?, completion: @escaping CompletionHandler) {
        guard let code = code, let page = page else {
            printMine("--- code page nil")
            return
        }
        
        dataTask?.cancel()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        state = .loading
        
        let url = listUrlWithCode(code, page: page)
        let session = URLSession.shared
        dataTask = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error as NSError?, error.code == -999 {
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data, let jsonDictionary = self.parse(json: jsonData) {
                
                
            }
            
        })
        dataTask?.resume()
    }
    
    fileprivate func listUrlWithCode(_ code: Int, page: Int) -> URL {
        let urlString =
            String(format: "http://condor.alarstudios.com/test/data.cgi?code=\(code)&p=\(page)")
        
        let url = URL(string: urlString)
        print("URL: \(url!)")
        return url!
    }
}































