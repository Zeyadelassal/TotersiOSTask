//
//  URLRequestBuilder.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible {
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
        var url = URL(string: CONST_API.API_URL.BASE_URL)!
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
        //        var headers = getHeaders()
        var headers: HTTPHeaders = [:]
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
        case .getMethod:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: paramaters)
    }
        
    func createGetParameters(with offset: Int? = nil) -> Parameters{
        let timeStamp = getTimeStamp()
        var parameters: Parameters = [:]
        parameters[CONST_API.PARAMETER_KEY.API_KEY]    = CONST_API.PARAMETER_VALUE.PUBLIC_API_KEY
        parameters[CONST_API.PARAMETER_KEY.TIME_STAMP] = timeStamp
        parameters[CONST_API.PARAMETER_KEY.HASH]       = getMD5Hash(for: timeStamp)
        if let offset = offset {
            parameters[CONST_API.PARAMETER_KEY.OFFSET] = offset
        }
        return parameters
    }
    
    private func getTimeStamp() -> Int {
        let since1970 = Date().timeIntervalSince1970
        let time = Int(since1970 * 1000)
        return time
    }

    private func getMD5Hash(for timeStamp: Int) -> String {
        let stringMD5 = "\(timeStamp)" + CONST_API.PARAMETER_VALUE.PRIVATE_API_KEY + CONST_API.PARAMETER_VALUE.PUBLIC_API_KEY
        return stringMD5.MD5
    }
    
//    func getHeaders() -> HTTPHeaders {
//
//    }
}
