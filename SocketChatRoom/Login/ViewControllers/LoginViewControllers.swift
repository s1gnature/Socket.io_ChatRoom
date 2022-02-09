//
//  LoginViewControllers.swift
//  SocketChatRoom
//
//  Created by mong on 2022/02/07.
//

import UIKit
import FirebaseAuth

final class LoginViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let pw = pwTextField.text
        else { return }
        
        Auth.auth().signIn(withEmail: email, password: pw) { [weak self] result, error in
            if let error = error {
                let alert = UIAlertController.simpleAlert(title: "로그인 실패", message: error.localizedDescription)
                
                self?.present(alert, animated: true, completion: nil)
                return
            }
            self?.performSegue(withIdentifier: "MainSegue", sender: self)
            print(result)
        }
    }
    @IBAction func annonymousLogin(_ sender: UIButton) {
    }
}
