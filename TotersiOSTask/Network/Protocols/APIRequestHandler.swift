//
//  APIRequestHandler.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation
import Alamofire

/// Response completion handler beautified.
typealias CallResponse<T> = ((ServerResponse<T>) -> Void)?

/// API protocol, The alamofire wrapper
protocol APIRequestHandler: HandleAlamofireResponse {
    
}

extension APIRequestHandler{
    
    func send<T: APIResponse>(_ request: URLRequestBuilder ,_ decoder: T.Type, progress: ((Progress) -> Void)? = nil, completion: CallResponse<T>) {
        if NetworkReachabilityManager()?.isReachable ?? false {
            debugPrint("********************************************************")
            debugPrint("RequestURL:",request.url.absoluteString)
            debugPrint("RequestURLHeaders:",request.urlRequest.allHTTPHeaderFields ?? "No Headers")
            debugPrint("RequestURLParameters:",request.paramaters ?? "No Parameters")
            debugPrint("RequestEncoding",request.encoding)
            debugPrint("********************************************************")
            AF.request(request).responseData { response in
                self.handleResponse(response, completion: completion)
            }.responseString{ response in
            debugPrint("########################################################")
            debugPrint("RequestURL:",request.url.absoluteString)
            debugPrint("Response:\(response)")
            debugPrint("########################################################")
            }
        } else {
            //            if !isCached {
            completion?(ServerResponse.failure(ResponseError.offline))
            //            }
        }
    }
}

