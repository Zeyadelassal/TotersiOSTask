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
            debugPrint("********************************************************")
            debugPrint("RequestURL:",url.absoluteString)
            debugPrint("RequestURLHeaders:",urlRequest.allHTTPHeaderFields ?? "No Headers")
            debugPrint("RequestURLParameters:",paramaters ?? "No Parameters")
            debugPrint("RequestEncoding",encoding)
            debugPrint("********************************************************")
            AF.request(self).responseData { response in
                self.handleResponse(response, completion: completion)
            }.responseString{ response in
            debugPrint("########################################################")
            debugPrint("RequestURL:",url.absoluteString)
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
