//
//  TableViewCellConfigurator.swift
//  SocketChatRoom
//
//  Created by mong on 2022/01/30.
//
/*
 참고
 https://swieeft.github.io/2021/01/21/SimpleToUseTableViewCell.html
*/

import UIKit

protocol XibConfigurator {
}
extension XibConfigurator {
    static var nibName: String {
        return String(describing: self)
    }
}

protocol TableViewCellConfigurator: XibConfigurator {
    static func register(to tableView: UITableView)
    static func dequeueReusableCell(from tableView: UITableView) -> Self?
    static var reuseIdentifier: String { get }
}

extension TableViewCellConfigurator {
    static func register(to tableView: UITableView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    static func dequeueReusableCell(from tableView: UITableView) -> Self? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else { return nil }
        return cell as? Self
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
