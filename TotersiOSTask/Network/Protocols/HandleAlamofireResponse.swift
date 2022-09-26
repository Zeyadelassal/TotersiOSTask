//
//  HandleAlamofireResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation
import Alamofire

protocol HandleAlamofireResponse {
    func handleResponse<T: APIResponse>(_ response: AFDataResponse<Data>, completion: CallResponse<T>)
}

extension HandleAlamofireResponse {
    
    func handleResponse<T: APIResponse>(_ response: AFDataResponse<Data>, completion: CallResponse<T>) {
        switch response.result {
        case .failure(let error):
            completion?(ServerResponse.failure(ResponseError.network(message: error.localizedDescription, code: response.response?.statusCode)))
        case .success(let value):
            handleSuccessResponse(value, completion: completion)
        }
    }
    
    func handleSuccessResponse<T: APIResponse>(
        _ value: Data,
        completion: CallResponse<T>) {
            do {
                let responseData = try T(data: value)
                if responseData.isSuccess {
                    completion?(ServerResponse<T>.success(responseData))
                } else {
                    completion?(ServerResponse.failure(responseData.error))
                }
            } catch let error {
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .typeMismatch(let key, let value):
                        debugPrint("error \(key), value \(value) and ERROR: \(decodingError.localizedDescription)")
                    case .valueNotFound(let key, let value):
                        debugPrint("error \(key), value \(value) and ERROR: \(decodingError.localizedDescription)")
                    case .keyNotFound(let key, let value):
                        debugPrint("error \(key), value \(value) and ERROR: \(decodingError.localizedDescription)")
                    case .dataCorrupted(let key):
                        debugPrint("error \(key), and ERROR: \(decodingError.localizedDescription)")
                    default:
                        debugPrint("ERROR: \(decodingError.localizedDescription)")
                    }
                }
                completion?(ServerResponse.failure(ResponseError.decoding))
            }
        }
}
