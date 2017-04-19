//
//  KnowledgeCell.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/3/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class KnowledgeCell: UITableViewCell {
   
    
    @IBOutlet weak var K2: UIImageView!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var k: UIImageView!
        @IBOutlet weak var View: UIView!
    @IBOutlet weak var Label: UILabel!
      

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
