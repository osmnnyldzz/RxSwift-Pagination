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
    private var viewModel = MyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindTableView()
        
        // Fetch server data
        self.viewModel.fetchModerators()
    }
}

// MARK: Rx Setup
extension ViewController {
    
    func bindTableView() {
        self.viewModel.dummyArray
            .bind(to: self.tableView
                .rx
                .items(cellIdentifier: MyTableViewCell.cellIdentifier,
                       cellType: MyTableViewCell.self))
        { index, element, cell in
            cell.titleLabel.text = element
        }
        .disposed(by: disposeBag)
        
    }
    
}
