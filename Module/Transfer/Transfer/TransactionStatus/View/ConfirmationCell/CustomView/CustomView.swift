//
//  CustomView.swift
//  Transfer
//
//  Created by Rizky Saputra on 30/05/21.
//

import UIKit

class CustomView: UIView {

    var nibName = "CustomView"
    
    @IBOutlet var view: UIView!
    

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override var intrinsicContentSize: CGSize {
        var height: CGFloat = 0
        for view in self.view.subviews {
            height = height + view.bounds.size.height
        }
        let x = UIScreen.main.bounds.size.width
        return CGSize(width: x, height: height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        invalidateIntrinsicContentSize()
        translatesAutoresizingMaskIntoConstraints = false
        xibSetUp()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        invalidateIntrinsicContentSize()
        translatesAutoresizingMaskIntoConstraints = false
        xibSetUp()
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

}
