//
//  BooldCell.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/24/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class BooldCell: UITableViewCell {

    @IBOutlet weak var insulin: UILabel!
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
