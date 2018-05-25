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


/*
{
    data = (
                McDonald,
                McDonald,
                {
                country = "United States of America";
                id = KVQQ;
                lat = "30.21877777777778";
                lon = "-81.87716666666665";
                name = CECIL;
                }
           );
 
    page = 1;
    status = ok;
}
*/





























