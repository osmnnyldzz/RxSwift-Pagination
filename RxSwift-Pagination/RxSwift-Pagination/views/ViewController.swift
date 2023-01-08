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
    
    var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .blue
        return indicator
    }()
    
    var loadingScreen: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var disposeBag = DisposeBag()
    private var viewModel = MyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subscribeResponse()
        
        self.subscribeLoading()
        self.subscribePrefetch()
        // Fetch server data
        self.viewModel.fetchModerators()
    }
}

// MARK: Rx Setup
extension ViewController {
    
    private func subscribeResponse() {
        self.viewModel.moderators
            .bind(to: self.tableView
                .rx
                .items(cellIdentifier: MyTableViewCell.cellIdentifier,
                       cellType: MyTableViewCell.self))
        { index, element, cell in
            
            cell.titleLabel.text = element.displayName
            
            let status = self.currentVisibleRow(for: IndexPath(row: index, section: 0))
            cell.configuration(status)

            
        }
        .disposed(by: disposeBag)
        
    }
    
    private func subscribeLoading() {
        self.viewModel
            .loading
            .subscribe { value in
                switch value.element {
                case true:
                    return self.loadingView(show:true)
                case false:
                    return self.loadingView(show:false)
                default:
                    break
                }
            }
            .disposed(by: self.disposeBag)
    }
    
    private func subscribePrefetch() {
        self.tableView
            .rx
            .prefetchRows
            .subscribe { indexPaths in
            guard let indexPaths = indexPaths.element else { return }
                
            if indexPaths.contains(where: self.currentVisibleRow) {
                self.viewModel.fetchModerators(true)
            }
                
                
            }.disposed(by: self.disposeBag)
    }
}

// MARK: Helpers
extension ViewController {
    
    func loadingView(show:Bool = true){
        if show {
            loadingScreen.frame = self.view.bounds
            activityIndicator.center = self.view.center
            activityIndicator.startAnimating()
            loadingScreen.addSubview(activityIndicator)
           
            self.view.addSubview(loadingScreen)
        } else {
            loadingScreen.removeFromSuperview()
        }
    }
    
    func currentVisibleRow(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= viewModel.moderators.value.count - 1
    }
}
   
