//
//  ViewController.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 7.01.2023.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    let createDummyArray:[String] = {
        var array:[String] = []
        for i in 0...20 {
            array.append("Title: \(i)")
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return createDummyArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.createDummyArray[indexPath.row]
        return cell
    }
}



