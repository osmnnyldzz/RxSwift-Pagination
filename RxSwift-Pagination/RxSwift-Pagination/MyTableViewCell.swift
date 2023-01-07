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
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}
