//
//  FBStoreManager.swift
//  SocketChatRoom
//
//  Created by mong on 2022/01/30.
//

import Foundation
import FirebaseFirestore

final class FBStoreManager {
    enum FBStoreError: Error {
        case FetchUserListFailure
    }
    
    private enum Path: String {
        case userList = "UserList"
    }
    
    static let shared = FBStoreManager()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func addUser(_ user: User) {
        db.collection(Path.userList.rawValue)
            .addDocument(data: [
                "profileImageData" : user.profileImageData,
                "nickname" : user.nickname,
                "stateMessage" : user.stateMessage
            ])
    }
    
    func getUserList(completion: @escaping(Result<UserList, Error>) -> Void) {
        db.collection(Path.userList.rawValue)
            .getDocuments() { querySnapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let userList = self.convertDocumentsToUserList(querySnapshot?.documents) else {
                    completion(.failure(FBStoreError.FetchUserListFailure))
                    return
                }
                    
                completion(.success(userList))
            }
    }
    
    private func convertDocumentsToUserList(_ documents: [QueryDocumentSnapshot]?) -> UserList? {
        guard let documents = documents else { return nil }

        var userList = UserList()
        
        for document in documents {
            let data = document.data()
            guard let profileImageData = data["profileImageData"] as? String,
                  let nickname = data["nickname"] as? String,
                  let stateMessage = data["stateMessage"] as? String
            else { return nil }
            
            let user = User(profileImageData: Data(), nickname: nickname, stateMessage: stateMessage)
            userList.append(of: user)
        }
        
        return userList
    }
}
