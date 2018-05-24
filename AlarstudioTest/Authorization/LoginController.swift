//
//  LoginController.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    var loginView: LoginView!
    
    var viewModel: LoginControllerViewModel? 

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewLoadings()
        setupMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupViewLoadings() {
        view.backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func setupMainView() {
        let mainView = LoginView(frame: self.view.frame)
        self.loginView = mainView
        self.loginView.loginAction = loginPressed
        self.view.addSubview(loginView)
        loginView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    fileprivate func loginPressed() {
        view.endEditing(true)
        
        guard let login = loginView.loginTextField.text else { return }
        guard let password = loginView.passwordTextField.text else { return }
        
        viewModel?.loginUser(username: login, password: password, completion:
            { result in
                switch result {
                case .sucsess:
                    break
                case .failure:
                    afterDelay(0, closure: {
                        afterDelay(0, closure:{
                            self.loginView.animateView(with: AnimationPresets.Shake.rawValue)
                        })
                    })
                    break
                }
        })
    }
    
    fileprivate func showNetworkError() {
        let alert = UIAlertController(title: NSLocalizedString("Whoops...", comment: "Error alert: title"),
                                      message: NSLocalizedString("Username or password is incorrect, try again", comment: "Error alert: message"),
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: "Error alert"), style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}















