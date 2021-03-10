//
//  ModelsCellTableViewCell.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit

class ModelsCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var modelYearLabel: UILabel!
    @IBOutlet weak var modelLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
