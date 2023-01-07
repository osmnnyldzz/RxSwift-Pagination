//
//  ViewController.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 7.01.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var disposeBag = DisposeBag()
    
    let createDummyArray:[String] = {
        var array:[String] = []
        for i in 0...20 {
            array.append("Title: \(i)")
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindTableView()

    }
}

// MARK: Rx Setup
extension ViewController {
    
    func bindTableView() {
        Observable.of(self.createDummyArray)
            .bind(to: self.tableView
                .rx
                .items(cellIdentifier: MyTableViewCell.cellIdentifier,
                       cellType: MyTableViewCell.self))
        { index, element, cell in
            cell.textLabel?.text = element
        }
        .disposed(by: disposeBag)
        
    }
}


// MARK: TableViewCell
class MyTableViewCell: UITableViewCell {
    static let cellIdentifier = "MyTableViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
}



