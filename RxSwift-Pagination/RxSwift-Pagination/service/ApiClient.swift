//
//  ApiClient.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

import Alamofire
import RxSwift

class ApiClient {
    func request(_ urlConvertible: URLRequestConvertible) -> Observable<ModeratorResponse> {
        
        return Observable.create { observer in
            let request = AF.request(urlConvertible).responseDecodable(of:ModeratorResponse.self) { (response) in
                switch response.result {
                    
                case .failure(let error):
                    observer.onError(error)
                case .success(let data):
                    observer.onNext(data)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
