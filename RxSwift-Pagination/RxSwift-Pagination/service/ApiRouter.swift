//
//  ApiRouter.swift
//  RxSwift-Pagination
//
//  Created by Osman Yıldız on 8.01.2023.
//

import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case fetchModerators
    
    func asURLRequest() throws -> URLRequest {
        let baseurl = "https://api.stackexchange.com/2.3"
        let request = try URLRequest(url: baseurl.asURL().appendingPathComponent(path), method: method)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
    // Parameters
    var parameters: Parameters {
        switch self {
        case .fetchModerators:
            return ["site":"stackoverflow"]
        }
    }
    
    // Method
    var method: HTTPMethod {
        switch self {
        case .fetchModerators:
            return .get
        }
    }
    
    // Path
    var path: String {
        switch self {
        case .fetchModerators:
            return "/users/moderators"
        }
    }   
}
