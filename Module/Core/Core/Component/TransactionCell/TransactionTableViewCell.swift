//
//  TransactionTableViewCell.swift
//  Core
//
//  Created by Rizky Saputra on 24/05/21.
//

import UIKit
import Kingfisher
import SkeletonView

public class TransactionTableViewCell: UITableViewCell {


    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.startLoading()
        amountLabel.font = UIFont(name:"NunitoSans-Bold", size:100)
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func startLoading() {
        [self.userImage, self.nameLabel, self.noteLabel, self.amountLabel].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    public func stopLoading() {
        [self.userImage, self.nameLabel, self.noteLabel, self.amountLabel].forEach {
            $0?.hideSkeleton()
        }
    }
    
    public func showData(transaction: TransactionEntity) {
        self.nameLabel.text = transaction.name
        self.noteLabel.text = transaction.notes
        
        if transaction.type == "in" {
            self.amountLabel.text = "+ \(transaction.amount.formatToIder())"
            self.amountLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            self.amountLabel.text = "- \(transaction.amount.formatToIder())"
            self.amountLabel.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        }
        
        let url = URL(string: transaction.imageUrl)
        self.userImage.kf.setImage(with: url)
    }
    
    
}
