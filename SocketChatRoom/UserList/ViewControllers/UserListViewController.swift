//
//  ViewController.swift
//  SocketChatRoom
//
//  Created by mong on 2022/01/29.
//

import UIKit
import FirebaseFirestore

final class UserListViewController: UIViewController {
    @IBOutlet var userListTableView: UITableView!
    
    var userList: UserList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUserListTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchUserList()
    }
    
    private func configureUserListTableView() {
        userListTableView.dataSource = self
        
        UserListTableViewCell.register(to: userListTableView)
    }
    
    private func fetchUserList() {
        FBStoreManager.shared.getUserList { result in
            switch result {
            case .success(let userList):
                self.userList = userList
                DispatchQueue.main.async {
                    self.userListTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let userList = userList,
            let cell = UserListTableViewCell.dequeueReusableCell(from: tableView)
        else { return UITableViewCell() }
        
        let user = userList[indexPath.row]
        cell.configure(nickName: user.nickname, profileImage: UIImage(), stateMessage: user.stateMessage)
        
        return cell
    }
}
