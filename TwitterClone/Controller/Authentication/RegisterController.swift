//
//  RegisterController.swift
//  TwitterClone
//
//  Created by Davin on 05/03/20.
//  Copyright © 2020 Leanbs. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    
    //MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)
        
        return view
    }()
    
    private lazy var fullnameContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image, textField: fullnameTextField)
        
        return view
    }()
    
    private lazy var usernameContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image, textField: usernameTextField)
        
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let fullnameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let haveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account", " Sign In")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    private let registerButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitle("Sign Up", for: .normal)
       button.setTitleColor(.twitterBlue, for: .normal)
       button.backgroundColor = .white
       button.heightAnchor.constraint(equalToConstant: 48).isActive = true
       button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
       button.layer.cornerRadius = 4
       button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
       return button
   }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleAddProfilePhoto() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func handleRegister() {
        print("handleRegister")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusPhotoButton.setDimensions(width: 120, height: 120)
        
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView,
            passwordContainerView,
            fullnameContainerView,
            usernameContainerView,
            registerButton
        ])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(haveAccountButton)
        haveAccountButton.anchor(left: view.leftAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               right: view.rightAnchor,
                               paddingLeft: 40,
                               paddingBottom: 16,
                               paddingRight: 40)
    }
}

// MARK: - UIImagePickerControllerDelegate

extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        
        plusPhotoButton.layer.cornerRadius = 120 / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.imageView?.contentMode = .scaleAspectFill
        plusPhotoButton.imageView?.clipsToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 4
        
        self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
