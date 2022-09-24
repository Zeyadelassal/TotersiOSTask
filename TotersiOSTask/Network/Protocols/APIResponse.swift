//
//  APIResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

protocol APIResponse: CodableInit {
    var code: Int { get }
    var message: String? { get }
}

extension APIResponse {
    
    var isSuccess: Bool {
        return code >= 200 && code < 300
    }
    
    var error: ResponseError {
        if let message = message {
            return .serverError(message: message, code: code)
        } else {
            return .unknown
        }
    }
}
