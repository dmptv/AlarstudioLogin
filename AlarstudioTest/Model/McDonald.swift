//
//  DataResult.swift
//  AlarstudioTest
//
//  Created by 123 on 25.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation
import SwiftyJSON

struct McDonald {
    var country: String
    var id: String
    var lat: String
    var lon: String
    var name: String
}

struct McDonaldsList {
    var page: Int?
    var status: String
    var mcDonalds: [McDonald]?
}






























