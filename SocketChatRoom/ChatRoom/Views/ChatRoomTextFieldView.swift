//
//  ChatRoomTextFieldView.swift
//  SocketChatRoom
//
//  Created by mong on 2022/02/06.
//

import UIKit

class ChatRoomTextFieldView: UIView {
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        guard let view = Bundle.main.loadNibNamed(Self.nibName, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = bounds
        addSubview(view)
        
        sendButton.isEnabled = false
        inputTextField.delegate = self
    }
}

extension ChatRoomTextFieldView: XibConfigurator {

}

extension ChatRoomTextFieldView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        sendButton.isEnabled = !(textField.text?.isEmpty ?? true) 
        
        return true
    }
}
