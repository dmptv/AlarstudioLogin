//
//  MainControllerViewModel.swift
//  AlarstudioTest
//
//  Created by 123 on 25.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation
import SwiftyJSON

class MainControllerViewModel: NSObject, NetworkLayerProtocol {
    typealias StateEnum = State
    typealias ResultType = Result

    var mcDonaldsList: Dynamic<[McDonald?]> = Dynamic([])
    var state: State = .notSearchedYet

    
    func getListWithSessionCode(_ code: Int?, page: Int = 1, completion: @escaping CompletionHandler) {
        
        state = .loading
        
        ApiClient.shared.getListSesion(code: code, page: page, completion: { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case .sucsess(let value as AnyObject):
                let list: [McDonald]? = (JSON(value)["data"].array?.map { json in
                    McDonald(country: json["country"].stringValue,
                             id: json["id"].stringValue,
                             lat: json["lat"].stringValue,
                             lon: json["lon"].stringValue,
                             name: json["name"].stringValue)
                    })
                strongSelf.mcDonaldsList.value = list!
                
                printMine("shared =", strongSelf.mcDonaldsList.value.count)
                
                strongSelf.state = .results
                completion(.sucsess(nil))
                break
            case .failure:
                printMine("failure list")
                strongSelf.state = .noResults
                completion(.failure)
                break
            }
            
        })
    }
  
    
    deinit {
        printMine("deinit: \(self)")
    }
    
}

/*
 func getListWithCode(_ code: Int?, page: Int = 1, completion: @escaping CompletionHandler) {
 
 state = .loading
 
 ApiClient.shared.getList(code: code, page: page) { [weak self] result in
 
 guard let strongSelf = self else { return }
 
 switch result {
 case .sucsess(let value as AnyObject):
 let list: [McDonald]? = (JSON(value)["data"].array?.map { json in
 McDonald(country: json["country"].stringValue,
 id: json["id"].stringValue,
 lat: json["lat"].stringValue,
 lon: json["lon"].stringValue,
 name: json["name"].stringValue)
 })
 strongSelf.mcDonaldsList.value = list!
 
 printMine("shared =", strongSelf.mcDonaldsList.value.count)
 
 strongSelf.state = .results
 completion(.sucsess(nil))
 break
 case .failure:
 printMine("failure list")
 strongSelf.state = .noResults
 completion(.failure)
 break
 }
 }
 }
 */

















