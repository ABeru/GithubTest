//
//  StarredController.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import UIKit

class StarredController: UIViewController {
    @IBOutlet weak var RepList: UITableView!
    var vm = StarredViewModel()
    var datasource: ReposDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
      assign()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.fetchFavorites {
            DispatchQueue.main.async { [weak self] in
                self?.RepList.reloadData()
            }
        }
    }
    func assign() {
        RepList.delegate = self
        datasource = ReposDataSource(vm)
        RepList.dataSource = datasource
    }
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DetailsVc = segue.destination as? DetailsController{
            DetailsVc.vm = DetailsViewModel(repository: vm.repository)
        }
    }
}
extension StarredController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.modelAt(indexPath.row)
        performSegue(withIdentifier: "details", sender: nil)
    }
}
