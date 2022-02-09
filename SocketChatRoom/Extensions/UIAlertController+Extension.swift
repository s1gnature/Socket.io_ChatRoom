//
//  UIAlertController+Extension.swift
//  SocketChatRoom
//
//  Created by mong on 2022/02/07.
//

import UIKit

extension UIAlertController {
    static func simpleAlert(title: String, message: String? = nil, action: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: action)
        alert.addAction(confirmAction)
        
        return alert
    }
}
