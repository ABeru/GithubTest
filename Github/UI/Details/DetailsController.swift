//
//  DetailsController.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import UIKit
import RxCocoa
import RxSwift
class DetailsController: BaseViewController {
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var star: UIButton!
    @IBOutlet weak var reposDesc: UILabel!
    var n = ""
    var vm: DetailsViewModel!
    var db = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUi()
    }
    func bindUi() {
        vm?.img
            .subscribe(onNext: { [unowned self] name in
                star.setImage(UIImage(systemName: name), for: .normal)
            }).disposed(by: db)
        star.tintColor = UIColor(named: vm.color)
        dateCreated.text = vm.date
        language.text = vm.language
        reposDesc.text = vm.description
    }
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addFavorites(_ sender: UIButton) {
        vm.buttonClicked()
    }
    @IBAction func reposLink(_ sender: UIButton) {
        vm.linkPressed()
    }

}
