//
//  Cafe.swift
//  AlarstudioTest
//
//  Created by 123 on 26.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit
import MapKit

class Cafe {
    var name: String?
    var midCoordinate = CLLocationCoordinate2D()
    
    static func parseCoord(dict: [String: Any], fieldName: String) -> CLLocationCoordinate2D {
        guard let coord = dict[fieldName] as? String else {
            return CLLocationCoordinate2D()
        }
        let point = CGPointFromString(coord)
        return CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
    }
    
    init(mc: McDonald) {
        self.midCoordinate = CLLocationCoordinate2D(latitude: Double(mc.lat) ?? 36.063456,
                                                    longitude:Double(mc.lon) ?? -95.880517)
        self.name = mc.name

    }
    
    
    
    
}





















