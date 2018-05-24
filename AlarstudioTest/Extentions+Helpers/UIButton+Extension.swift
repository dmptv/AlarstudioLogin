//
//  UIButton+Extension.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit
import Spring

extension UIButton {
    public convenience init(title: String, borderColor: UIColor) {
        self.init()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.setAnchor(width: 0, height: 50)
    }
}

extension SpringButton {
    @objc public convenience init(spring title: String, borderColor: UIColor) {
        self.init()
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18), .foregroundColor: UIColor.white]))
        self.setAttributedTitle(attributedString, for: .normal)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.setAnchor(width: 0, height: 40)
    }
}









