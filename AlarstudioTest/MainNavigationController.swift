//
//  MainNavigationController.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isLoggedIn() {
            let mainController = MainController()
            mainController.viewModel = MainControllerViewModel()
            viewControllers = [mainController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.15)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    @objc func showLoginController() {
        let loginController  = LoginController()
        loginController.viewModel = LoginControllerViewModel()
        present(loginController, animated: true, completion: { })
    }

}

















