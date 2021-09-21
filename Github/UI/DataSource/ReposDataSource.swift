//
//  ReposDataSource.swift
//  Github
//
//  Created by Alexandre on 03.09.21.
//

import Foundation
import UIKit
import SDWebImage
class ReposDataSource: NSObject, UITableViewDataSource {
    let cellIdentifier = "ReposCell"
    private var viewModel: ViewModel
    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ReposCell
        viewModel.modelAt(indexPath.row)
        cell.Avatar.sd_setImage(with: URL(string: viewModel.avatar))
        cell.RepositoryName.text = viewModel.repositoryName
        cell.Username.text = viewModel.userName
        return cell
    }
   
    
    
}

