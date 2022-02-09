//
//  SignUpViewController.swift
//  SocketChatRoom
//
//  Created by mong on 2022/02/07.
//

import UIKit
import FirebaseAuth

final class SignUpViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    
    @IBAction func signUp(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let pw = pwTextField.text
        else { return }
        
        Auth.auth().createUser(withEmail: email, password: pw) { [weak self] result, error in
            let alert: UIAlertController
            
            if let error = error {
                alert = UIAlertController.simpleAlert(title: "회원가입 실패", message: error.localizedDescription)
            } else {
                alert = UIAlertController.simpleAlert(title: "회원가입 성공", message: result?.user.email, action: { (_) in self?.dismiss(animated: true, completion: nil)})
            }
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
