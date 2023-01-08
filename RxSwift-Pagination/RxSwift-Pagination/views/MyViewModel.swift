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
    var page = 0
    
    private var disposeBag = DisposeBag()
    private var apiClient = ApiClient()

    func fetchModerators(_ more: Bool = false) {
        DispatchQueue.main.async {
            self.page += 1
            
            if self.page == 1 {
                self.loading.onNext(true)
            }
           
            self.apiClient.request(ApiRouter.fetchModerators(page: self.page))
                .asObservable()
                .subscribe(
                    onNext: { response in
                        if more {
                            self.moderators.accept(self.moderators.value + response.items)
                        } else {
                            self.moderators.accept(response.items)
                        }
                        self.loading.onNext(false)
                    },
                    onError: { (error) in
                        print(error.localizedDescription)
            })
                .disposed(by: self.disposeBag)
        }
    }
}
