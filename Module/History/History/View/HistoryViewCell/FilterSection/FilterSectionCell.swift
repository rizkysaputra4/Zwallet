//
//  FilterSectionCell.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import UIKit
import Core

class FilterSectionCell: UITableViewCell {

    @IBOutlet weak var inView: UIView!
    @IBOutlet weak var outView: UIView!
    @IBOutlet weak var filterBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loadStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadStyle() {
        self.inView.setBorder(radius: 10, width: 2, color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8470588235), withShadow: true)
        self.outView.setBorder(radius: 10, width: 2, color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.8470588235), withShadow: true)
        self.filterBtn.setBorder(width: 2, radius: 10, color: #colorLiteral(red: 0.3750250936, green: 0.3682695627, blue: 0.4161003828, alpha: 0.8470588235))
    }
    
}
