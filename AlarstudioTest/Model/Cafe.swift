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
    var overlayBoundingMapRect: MKMapRect?
    
    static func parseCoord(dict: [String: Any], fieldName: String) -> CLLocationCoordinate2D {
        guard let coord = dict[fieldName] as? String else {
            return CLLocationCoordinate2D()
        }
        let point = CGPointFromString(coord)
        return CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
    }
    
    init(filename: String) {
        self.midCoordinate = CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.352222)
    }
    
    
    
    
}





















