//
//  AllmenuCell.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/11/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class AllmenuCell: UITableViewCell {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var cal: UILabel!
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
