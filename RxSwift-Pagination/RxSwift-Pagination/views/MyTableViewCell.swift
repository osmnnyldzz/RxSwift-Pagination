//
//  MyTableViewCell.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    static let cellIdentifier = "MyTableViewCell"
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet{
            activityIndicator.isHidden = true
            activityIndicator.color = .red
        }
    }
    
    func configuration(_ status: Bool) {
        if status {
            self.activityIndicator.isHidden = false
            self.titleLabel.isHidden = true
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.isHidden = true
            self.titleLabel.isHidden = false
            self.activityIndicator.stopAnimating()
        }
    }
}
