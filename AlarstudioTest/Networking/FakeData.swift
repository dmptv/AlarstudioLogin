//
//  FAkeData.swift
//  AlarstudioTest
//
//  Created by 123 on 30.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation

class FakeData {
    
    var items: [McDonald]
    
    
    
    init() {
        let dict1 = ["country": "United States of America",
                     "id": "KVQQ",
                     "lat": "30.21877777777778",
                     "lon": "-81.87716666666665",
                     "name": "CECIL"]
        let dict2 = ["country": "United States of America",
                     "id": "KNQX",
                     "lat": "24.57463611111111",
                     "lon": "-81.68664444444445",
                     "name": "KEY WEST NAS/BOCA CHICA FIELD"]
        
        let dict3 = ["country": "United States of America",
                     "id": "KEYW",
                     "lat": "24.55611111111111",
                     "lon": "-81.75955555555555",
                     "name": "KEY WEST INTL"]
        
        let dict4 = ["country": "United States of America",
                     "id": "KISM",
                     "lat": "28.28980555555556",
                     "lon": "-81.43708333333333",
                     "name": "KISSIMMEE GATEWAY"]
        
        let dict5 = ["country": "United States of America",
                     "id": "KLAL",
                     "lat": "27.98891666666667",
                     "lon": "-82.01855555555555",
                     "name": "LAKELAND LINDER RGNL"]
        
        let dict6 = ["country": "United States of America",
                     "id": "KLEE",
                     "lat": "28.82288888888889",
                     "lon": "-81.80841666666666",
                     "name": "LEESBURG INTL"]
        
        let dict7 = ["country": "United States of America",
                     "id": "KMCF",
                     "lat": "27.84933333333333",
                     "lon": "-82.52116666666666",
                     "name": "MACDILL AFB"]
        
        let dict8 = ["country": "United States of America",
                     "id": "KMTH",
                     "lat": "24.72619444444444",
                     "lon": "-81.05136111111111",
                     "name": "THE FLORIDA KEYS MARATHON"]
        
        let dict9 = ["country": "United States of America",
                     "id": "KNRB",
                     "lat": "30.391375",
                     "lon": "-81.42451944444444",
                     "name": "MAYPORT NS (ADM DAVID L. MCDONALD FIELD)"]
        
        let dict10 = ["country": "United States of America",
                      "id": "KMLB",
                      "lat": "28.10275",
                      "lon": "-80.64525",
                      "name": "MELBOURNE INTL"]
        
        let arrJson = [dict1, dict2, dict3, dict4, dict5,
                       dict6, dict7, dict8, dict9, dict10]
        
        self.items = []
        for json in arrJson {
            let mc = McDonald(json: json)
            self.items.append(mc)
        }
        
    }

    
}













