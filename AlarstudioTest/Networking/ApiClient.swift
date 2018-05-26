//
//  ApiClient.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class ApiClient: NetworkLayerProtocol {

    typealias ResultType = Result
    typealias StateEnum = State
    
    static let shared = ApiClient()
    private init(){}
    fileprivate var dataTask: URLSessionDataTask? = nil
    
    enum Codes: String {
        case OK = "ok"
        case Status = "status"
        case Code = "code"
    }
    
    fileprivate(set) var state: State = .notSearchedYet
    
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
                
                let code = Int(jsonDictionary["code"] as! String)
                
                guard let codeInt = code else {
                    printMine("code is not integer")
                    completion(.failure)
                    return
                }
                UserDefaults.standard.setValidationCode(value: codeInt)
                completion(.sucsess(nil))
            } else {
                printMine("Wrong status: ")
                completion(.failure)
            }
            
        })
        dataTask?.resume()
        
    }

    
    public func getListSesion(code: Int?, page: Int?, completion: @escaping CompletionHandler) {
        guard let code = code, let page = page else {
            printMine("--- code or  page nil")
            return
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        state = .loading
        
        let url = listUrlWithCode(code, page: page)
        let session = URLSession.shared
        dataTask = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error as NSError?, error.code == -999 {
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data, let jsonDictionary = self.parse(json: jsonData) {

                completion(.sucsess(jsonDictionary))
            } else {
                printMine("Wrong status: ")
                completion(.failure)
            }
            
        })
        dataTask?.resume()
    }
 
}


// MARK: - Helpers

extension ApiClient {
    
    fileprivate func listUrlWithCode(_ code: Int, page: Int) -> URL {
        let urlString =
            String(format: "http://condor.alarstudios.com/test/data.cgi?code=\(code)&p=\(page)")
        
        let url = URL(string: urlString)
        return url!
    }
    
    fileprivate func parse(json data: Data) -> Json? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? Json
        } catch {
            print("JSON Error: \(error)")
            return nil
        }
    }
    
    fileprivate func authUrlWithUsername(_ username: String, password: String) -> URL {
        let urlString =
            String(format: "http://condor.alarstudios.com/test/auth.cgi?username=\(username)&password=\(password)")
        
        let url = URL(string: urlString)
        return url!
    }
}


























