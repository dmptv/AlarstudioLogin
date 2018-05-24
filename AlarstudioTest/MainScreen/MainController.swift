//
//  ViewController.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sing Out", style: .plain, target: self, action: #selector(handleSingOut))
    }

    @objc func handleSingOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)

        let loginController = LoginController()
        loginController.viewModel = LoginControllerViewModel()
        present(loginController, animated: true, completion: nil)
    }

    deinit {
        printMine("deinit: \(self)")
    }
}









