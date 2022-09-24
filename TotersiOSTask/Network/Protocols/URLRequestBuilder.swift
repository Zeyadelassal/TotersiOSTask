//
//  URLRequestBuilder.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    var paramaters: Parameters? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var additionalHeaders : HTTPHeaders? { get }
    var contentTypeHeader : String? { get }
    var url: URL { get }
    var urlRequest: URLRequest { get }
    var encoding: ParameterEncoding { get }
}

extension URLRequestBuilder {
    
    var url: URL {
        var url = URL(string: CONST_API.BASE_URL)!
        url.appendPathComponent(path)
        return url
    }
    
    var urlRequest: URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        return urlRequest
    }
    
    var headers: HTTPHeaders {
        var headers = getHeaders()
        return headers
    }
    
    var additionalHeaders : HTTPHeaders? {
        return nil
    }
    
    var contentTypeHeader : String? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: paramaters)
    }
    
//    func getHeaders() -> HTTPHeaders {
//
//    }
}
