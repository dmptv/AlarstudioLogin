//
//  NetworkError.swift
//  AlarstudioTest
//
//  Created by 123 on 25.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import Foundation
import UIKit

enum NetworkError {
    case authFailed
    case codeExpired
}

internal func showNetworkError(controller: UIViewController) {
    let alert = UIAlertController(title: NSLocalizedString("Whoops...", comment: ""),
                                  message: NSLocalizedString("Error Domain=NSCocoaErrorDomain Code=3840 Badly formed object around character .", comment: ""),
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}

