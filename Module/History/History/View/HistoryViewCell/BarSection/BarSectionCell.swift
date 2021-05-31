//
//  BarSectionCell.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import UIKit

class BarSectionCell: UITableViewCell {
    
    var delegate: BarSectionCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.navigateToHome()
    }
}
