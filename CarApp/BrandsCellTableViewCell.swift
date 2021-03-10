//
//  BrandsCellViewControllerTableViewCell.swift
//  CarApp
//
//  Created by Владимир Ефимов on 10.03.2021.
//

import UIKit

class BrandsCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandYearLabel: UILabel!
    @IBOutlet weak var brandLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
