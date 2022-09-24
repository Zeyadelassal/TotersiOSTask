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
        var url = URL(string: Constants.KLMSTestingSrverBaseURL)!
        url.appendPathComponent(path)
        return url
    }
    
    var urlRequest: URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = mergeHeaders()
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
    
    func getHeaders() -> HTTPHeaders {
      
    }
    
    private func mergeHeaders() -> HTTPHeaders {
        guard let additionalHeaders = additionalHeaders else {return self.headers}
        var mergedHeaders = self.headers
        for (key,value) in additionalHeaders {
            mergedHeaders[key] = value
        }
        return mergedHeaders
    }
}
