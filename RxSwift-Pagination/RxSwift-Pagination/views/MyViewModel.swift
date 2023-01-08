//
//  MyViewModel.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

import RxSwift
import RxCocoa

class MyViewModel {
    var moderators = BehaviorRelay<[Moderator]>.init(value: [])
    var apiClient = ApiClient()

    func fetchModerators() {
        self.apiClient.request(ApiRouter.fetchModerators) { response in
            switch response {
            case.success(let response):
                self.moderators.accept(response.items)
            case .failure(let error):
                print(error)
            }
        }
    }
}
