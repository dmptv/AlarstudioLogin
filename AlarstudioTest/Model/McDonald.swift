//
//  DataResult.swift
//  AlarstudioTest
//
//  Created by 123 on 25.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation
import SwiftyJSON
typealias Json = [String: Any]

struct McDonald {
    var country: String
    var id: String
    var lat: String
    var lon: String
    var name: String
    
    init(json: Json) {
        self.country = json["country"] as! String
        self.id = json["id"] as! String
        self.lat = "\(String(describing: json["lat"]))"
        self.lon = "\(String(describing: json["lon"]))"
        self.name = json["name"] as! String
    }
}

struct McDonaldsList {
    var page: Int?
    var status: String
    var mcDonalds: [McDonald]?
}






























