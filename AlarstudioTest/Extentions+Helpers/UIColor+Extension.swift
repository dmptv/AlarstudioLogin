//
//  UIColor+Extension.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static func mainBlue() -> UIColor {
        return #colorLiteral(red: 0.217050147, green: 0.2982768247, blue: 0.4743416878, alpha: 1)
    }
    
    static var greenBorderColor: UIColor = {
        return UIColor(r: 80, g: 227, b: 194)
    }()
    
    static var redBorderColor: UIColor = {
        return UIColor(r: 255, g: 151, b: 164)
    }()
    
    static var greenBackGround: UIColor = {
    return UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
    }()
    
}









