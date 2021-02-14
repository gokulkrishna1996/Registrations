//
//  MainTableViewCell.swift
//  Registration
//
//  Created by Gokulkrishna Jayachandran on 14/2/21.
//

import Foundation
import Foundation
import UIKit

class MainTableViewCell: UITableViewCell{


    @IBOutlet weak var regoLabel: UILabel!
    
    @IBOutlet weak var carDetailsLabel: UILabel!
    
    @IBOutlet weak var regoStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
