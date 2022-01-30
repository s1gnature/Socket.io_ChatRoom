//
//  UserListTableViewCell.swift
//  SocketChatRoom
//
//  Created by mong on 2022/01/29.
//

import UIKit

class UserListTableViewCell: UITableViewCell, TableViewCellConfigurator {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nickName: UILabel!
    @IBOutlet var stateMessage: UILabel!
    
    func configure(nickName: String, profileImage: UIImage, stateMessage: String?) {
        self.profileImage.image = profileImage
        self.nickName.text = nickName
        self.stateMessage.text = stateMessage
    }
}
