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
    var loading = PublishSubject<Bool>()
    
    private var disposeBag = DisposeBag()
    private var apiClient = ApiClient()

    func fetchModerators() {
        self.loading.onNext(true)
        self.apiClient.request(ApiRouter.fetchModerators)
            .asObservable()
            .subscribe(
                onNext: { response in
                    self.moderators.accept(response.items)
                    self.loading.onNext(false)
                },
                onError: { (error) in
                    print(error)
        })
            .disposed(by: self.disposeBag)

    }
}
