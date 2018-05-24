//
//  LoginView.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit
import Spring

class LoginView: SpringView {
    
    var loginAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        let stackView = createStackView(views: [loginTextField,
                                                passwordTextField,
                                                loginButton])
        addSubview(backgroundImageView)
        addSubview(stackView)
        backgroundImageView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        stackView.setAnchor(width: self.frame.width - 60, height: 140)
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Bitmap")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let loginTextField: UITextField = {
        let tf = UITextField(placeHolder: "username")
        tf.clearsOnBeginEditing = true
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField(placeHolder: "password")
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = true
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let loginButton: SpringButton = {
        let button = SpringButton(spring: "Login", borderColor: .greenBorderColor)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLogin() {
       loginAction?()
    }
    
    public func animateView() {
        loginButton.animation = AnimationPresets.Fall.rawValue
        loginButton.curve = AnimationCurves.EaseOut.rawValue
        loginButton.duration = 0.5
        loginButton.force = 2.9
        loginButton.animate()
    }
    
    public func animateButton() {
        loginButton.animation = AnimationPresets.Shake.rawValue
        loginButton.curve = AnimationCurves.EaseOut.rawValue
        loginButton.duration = 0.5
        loginButton.force = 2.9
        loginButton.animate()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


























