//
//  ViewController.swift
//  Github
//
//  Created by Alexandre on 01.09.21.
//

import UIKit
import SDWebImage
import RxCocoa
import RxSwift
class ViewController: BaseViewController {
    @IBOutlet weak var RepList: UITableView!
    @IBOutlet weak var Search: UISearchBar!
    var vm = MainViewModel()
    var db = DisposeBag()
    var datasource: ReposDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUi()
 
    }
    private func bindUi() {
        vm.reload
            .subscribe(onNext: { _ in
                DispatchQueue.main.async { [weak self] in
                          self?.RepList.reloadData()
                      }
            }).disposed(by: db)
        Search.delegate = self
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
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.modelAt(indexPath.row)
        performSegue(withIdentifier: "details", sender: nil)
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        vm.text.accept(searchText)
       
    }
}

