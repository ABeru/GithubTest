//
//  DetailsController.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import UIKit

class DetailsController: BaseViewController {
    @IBOutlet weak var dateCreated: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var star: UIButton!
    @IBOutlet weak var reposDesc: UILabel!
    var vm: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUi()
    }
    func bindUi() {
        vm?.checkFavorites { [weak self] in
            self?.star.setImage(UIImage(systemName: "star.fill"), for: .normal)
            self?.star.tintColor = .systemBlue
        }
        dateCreated.text = vm?.date
        language.text = vm?.language
        reposDesc.text = vm?.description
    }
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addFavorites(_ sender: UIButton) {
        if vm?.check == true {
            star.setImage(UIImage(systemName: "star"), for: .normal)
            star.tintColor = .systemBlue
            vm?.removeRepository()
        }
        else {
            star.setImage(UIImage(systemName: "star.fill"), for: .normal)
            star.tintColor = .systemBlue
            vm?.saveRepository()
        }
    }
    @IBAction func reposLink(_ sender: UIButton) {
        vm?.linkPressed()
    }
    


}
