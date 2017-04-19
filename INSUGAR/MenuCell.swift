//
//  MenuCell.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/19/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sugar: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
