//
//  TransactionGroupHeader.swift
//  History
//
//  Created by Rizky Saputra on 28/05/21.
//

import UIKit
import Kingfisher
import Core
import SkeletonView

class TransactionCellViewManager: UIView {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet var view: UIView!
   
    
    @IBOutlet weak var transactionImage: UIImageView!
    @IBOutlet weak var transactionName: UILabel!
    @IBOutlet weak var transactionGroup: UILabel!
    @IBOutlet weak var transactionAmount: UILabel!
    
    var nibName = "TransactionViewCell"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
        startLoading()
    }

    func xibSetUp() {
        view = loadViewFromNib(nibName: self.nibName)
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    
    }

    func loadViewFromNib(nibName: String) -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func changeXib(nibName: String) {
        view = loadViewFromNib(nibName: nibName)
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func showData(transactionData: TransactionHistoryEntity) {
        self.transactionName.text = transactionData.name
        self.transactionGroup.text = transactionData.notes
        self.transactionAmount.text = transactionData.amount.formatToIdr()
        self.transactionImage.kf.setImage(with: URL(string: transactionData.image))
        
    }
    
    func startLoading() {
        transactionName.showAnimatedGradientSkeleton()
        transactionName.showAnimatedGradientSkeleton()
        transactionGroup.showAnimatedGradientSkeleton()
        transactionAmount.showAnimatedGradientSkeleton()
    }
    
    func stopLoading() {
        transactionName.hideSkeleton()
        transactionName.hideSkeleton()
        transactionGroup.hideSkeleton()
        transactionAmount.hideSkeleton()
    }
}
