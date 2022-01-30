//
//  User.swift
//  SocketChatRoom
//
//  Created by mong on 2022/01/30.
//

import Foundation

struct UserList {
    private(set) var userList: [User]
    lazy var count: Int = {
        userList.count
    }()
    
    subscript(_ index: Int) -> User {
        userList[index]
    }
    
    init() {
        userList = []
    }
    
    mutating func append(of user: User) {
        userList.append(user)
    }
}

struct User {
    let profileImageData: Data
    let nickname: String
    let stateMessage: String
    
    init(profileImageData: Data, nickname: String, stateMessage: String = "") {
        self.profileImageData = profileImageData
        self.nickname = nickname
        self.stateMessage = stateMessage
    }
}
