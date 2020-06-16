//
//  ExpandableTableViewCell.swift
//  expandable-table-view
//
//  Created by Yoeun Samrith on 6/15/20.
//  Copyright © 2020 Yoeun Samrith. All rights reserved.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonContainerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    
    
    var isExpaned = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        print("selected --- \(selected)")
            if selected {
                self.expandCell()
                isExpaned = true
            
            } else {
                self.collapseCell()
                isExpaned = false
            }
        
        
    }
    
    func bind(_ title: String) {
        titleLabel.text = title
    }
    
    func expandCell() {
        
        self.buttonContainerViewHeight.constant = 30.0
        self.contentView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.4) {[weak self] in
            print("double Pi \(Double.pi)")
            self?.arrowButton.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi),1.0, 0.0, 0.0)
//            self?.arrowButton.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
        }
    }
    
    func collapseCell() {
        self.buttonContainerViewHeight.constant = 0
        self.contentView.layoutIfNeeded()
        
            UIView.animate(withDuration: 0.3) {[weak self] in
                    print("double Pi \(Double.pi)")
                    self?.arrowButton.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0.0, 0.0, 0.0)
        //            self?.arrowButton.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
                }
        
    }
    
    @IBAction func arrowButtonDidTapped(_ sender: UIButton) {
        
        
        
        setSelected(true, animated: true)
        if let superView = self.superview, let tableView = superView as? UITableView {
            
            tableView.visibleCells.forEach { cell in
                if let expandableCell = cell as? ExpandableTableViewCell {
                    if cell != self {
                        cell.setSelected(false, animated: false)
                    }
                }
            }
//            UIView.setAnimationsEnabled(false)
            tableView.performBatchUpdates(nil, completion: nil)
        }
        
    }
    
}
