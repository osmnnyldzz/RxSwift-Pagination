//
//  ApiClient.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

import Alamofire

class ApiClient {
    func request(_ urlConvertible: URLRequestConvertible,
                 _ completion: @escaping (Result<ModeratorResponse, AFError>) -> Void ) {
        
        AF.request(urlConvertible).responseDecodable(of:ModeratorResponse.self) { (response) in
            switch response.result {
                
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let value):
                completion(.success(value))
                
            }
        }
    }
}
