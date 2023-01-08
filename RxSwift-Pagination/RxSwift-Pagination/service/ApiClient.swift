//
//  ApiClient.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

import Alamofire

class ApiClient {
    func request(_ urlConvertible: URLRequestConvertible) {
        AF.request(urlConvertible).responseDecodable(of:ModeratorResponse.self) { (response) in
            switch response.result {
            case .failure(let error):
                print("Result: Error \(error)")
            case .success(let data):
                print("Result: Success \(data.items.first?.userId)")
            }
        }
    }
}
