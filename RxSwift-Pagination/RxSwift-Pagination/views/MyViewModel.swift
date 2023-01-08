//
//  MyViewModel.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

import RxSwift
import RxCocoa

class MyViewModel {
    var dummyArray = BehaviorRelay<[String]>.init(value: [])
    var apiClient = ApiClient()

    init() {
        self.createDummyArray()
    }
    
    func fetchModerators() {
        self.apiClient.request(ApiRouter.fetchModerators)
    }
    
    private func createDummyArray() {
        for i in 0...20 {
            self.dummyArray.accept(self.dummyArray.value + ["Title: \(i)"])
        }
    }
}
