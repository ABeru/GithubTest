//
//  ReposCell.swift
//  Github
//
//  Created by Alexandre on 02.09.21.
//

import UIKit

class ReposCell: UITableViewCell {
    @IBOutlet weak var Avatar: UIImageView!
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var RepositoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
