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

extension APIRequestHandler where Self: URLRequestBuilder {
    
    func send<T: APIResponse>(_ decoder: T.Type, progress: ((Progress) -> Void)? = nil, completion: CallResponse<T>) {
        if NetworkReachabilityManager()?.isReachable ?? false {
            #if DEBUG
            print("********************************************************")
            print("RequestURL:",url.absoluteString)
            print("RequestURLHeaders:",urlRequest.allHTTPHeaderFields ?? "No Headers")
            print("RequestURLParameters:",paramaters ?? "No Parameters")
            print("RequestEncoding",encoding)
            print("********************************************************")
            #endif
            AF.request(self).responseData { response in
                self.handleResponse(response, completion: completion)
            }.responseString{ response in
            #if DEBUG
            print("########################################################")
            print("RequestURL:",url.absoluteString)
            print("Response:\(response)")
            print("########################################################")
            #endif
            }
        } else {
//            if !isCached {
                completion?(ServerResponse.failure(ResponseError.offline))
//            }
        }
    }
}
