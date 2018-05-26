//
//  MainControllerViewModel.swift
//  AlarstudioTest
//
//  Created by 123 on 25.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation

class MainControllerViewModel: NSObject, NetworkLayerProtocol {
    typealias StateEnum = State
    typealias ResultType = Result

    var mcDonaldsList: Dynamic<[McDonald?]> = Dynamic([])
    var state: State = .notSearchedYet

    func getListWithSessionCode(_ code: Int?, page: Int = 1, completion: @escaping CompletionHandler) {
                
        ApiClient.shared.getListSesion(code: code, page: page, completion: { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case .sucsess(let value as AnyObject):

                if let data = value["data"] as? [Json] {
                    let list = data.map { json in
                        McDonald(json: json)
                    }
                    strongSelf.mcDonaldsList.value = list
                }
               
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


















